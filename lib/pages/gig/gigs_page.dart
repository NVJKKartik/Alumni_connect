import 'package:alumni_connect/pages/gig/tabs/gig_category_tab.dart';
import 'package:alumni_connect/pages/gig/tabs/home_tab.dart';
import 'package:flutter/material.dart';

class GigsPage extends StatefulWidget {
  const GigsPage({
    super.key,
    required this.selectedTab,
  });
  final int selectedTab;

  @override
  State<GigsPage> createState() => _GigsPageState();
}

class _GigsPageState extends State<GigsPage> {
  final List<String> tabs = <String>[
    'Home',
    'Data Scientist',
    'Software Developer',
    'App Developer',
    'Machine Learning Engineer',
    'Artificial Intelligence Engineer',
    'Embedded Systems Engineer',
    'Network Security Analyst',
    'Web3 Developer',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.selectedTab,
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  floating: true,
                  pinned: true,
                  backgroundColor: Colors.black,
                  centerTitle: false,
                  elevation: 0,
                  title: const Text(
                    'Jobs and Internships',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(58),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 6),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TabBar(
                          isScrollable: true,
                          labelPadding:
                              const EdgeInsets.only(left: 8, right: 8),
                          indicatorColor: Colors.transparent,
                          tabs: tabs
                              .map(
                                (String name) => Tab(
                                  child: Container(
                                    height: 44,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color: const Color(0xff242424),
                                    ),
                                    child: Text(name),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              HomeTab(),
              GigCategoryTab(
                category: 'Software Engineer',
              ),
              GigCategoryTab(
                category: 'Data Scientist',
              ),
              GigCategoryTab(
                category: 'App Developer',
              ),
              GigCategoryTab(
                category: 'Machine Learning Engineer',
              ),
              GigCategoryTab(
                category: 'AI Engineer',
              ),
              GigCategoryTab(
                category: 'Embeddings System Engineer',
              ),
              GigCategoryTab(
                category: 'Network Security Analyst',
              ),
              GigCategoryTab(
                category: 'Web3 Developer',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
