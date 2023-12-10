import 'package:alumni_connect/pages/jobposting/tabs/jobposting_category_tab.dart';
import 'package:alumni_connect/pages/jobposting/tabs/home_tab.dart';
import 'package:flutter/material.dart';

class jobpostingsPage extends StatefulWidget {
  const jobpostingsPage({
    super.key,
    required this.selectedTab,
  });
  final int selectedTab;

  @override
  State<jobpostingsPage> createState() => _jobpostingsPageState();
}

class _jobpostingsPageState extends State<jobpostingsPage> {
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
        resizeToAvoidBottomInset: true,
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
              jobpostingCategoryTab(
                category: 'Software Engineer',
              ),
              jobpostingCategoryTab(
                category: 'Data Scientist',
              ),
              jobpostingCategoryTab(
                category: 'App Developer',
              ),
              jobpostingCategoryTab(
                category: 'Machine Learning Engineer',
              ),
              jobpostingCategoryTab(
                category: 'AI Engineer',
              ),
              jobpostingCategoryTab(
                category: 'Embeddings System Engineer',
              ),
              jobpostingCategoryTab(
                category: 'Network Security Analyst',
              ),
              jobpostingCategoryTab(
                category: 'Web3 Developer',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
