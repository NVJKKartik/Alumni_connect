import 'package:alumni_connect/pages/gig/tabs/gig_category_tab.dart';
import 'package:alumni_connect/pages/gig/tabs/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GigsPage extends StatefulWidget {
  const GigsPage({
    super.key,
    required this.selectedTab,
  });
  final int selectedTab;

  @override
  State<GigsPage> createState() => _GigsPageState();
}

class GigCategoryTab extends StatelessWidget {
  final String category;

  const GigCategoryTab({Key? key, required this.category}) : super(key: key);

  // Define a list of constant job cards for each category
  List<Map<String, dynamic>> get jobCards {
    switch (category.toLowerCase()) {
      case 'data scientist':
        return [
          {
            'title': 'Data Scientist',
            'startingPrice': 60000,
            'location': 'Bangalore',
            'imageURL': 'https://m.media-amazon.com/images/G/31/social_share/amazon_logo._CB633266945_.png',
          },
          {
            'title': 'Data Scientist',
            'startingPrice': 65000,
            'location': 'Hyderabad',
            'imageURL': 'https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png?w=700&h=456',
          },
          // Add more job cards for Data Scientist category as needed
        ];
      case 'software developer':
        return [
          {
            'title': 'Software Developer Intern',
            'startingPrice': 50000,
            'location': 'Bangalore',
            'imageURL': 'https://53.fs1.hubspotusercontent-na1.net/hub/53/hubfs/image8-2.jpg?width=595&height=400&name=image8-2.jpg',
          },
          {
            'title': 'Software Developer',
            'startingPrice': 55000,
            'location': 'Hyderabad',
            'imageURL': 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Goldman_Sachs.svg/1200px-Goldman_Sachs.svg.png',
          },
          // Add more job cards for Software Developer category as needed
        ];
      case 'app developer':
        return [
          {
            'title': 'App Developer',
            'startingPrice': 55000,
            'location': 'Bangalore',
            'imageURL': 'https://play-lh.googleusercontent.com/LHjOai6kf1IsstKNWO9jbMxD-ix_FVYaJSLodKCqYQdoFVzQBuV9z5txxzcTagQcyX8',
          },
          {
            'title': 'App Developer',
            'startingPrice': 60000,
            'location': 'Hyderabad',
            'imageURL': 'https://assets.entrepreneur.com/content/3x2/2000/20180511063849-flipkart-logo-detail-icon.jpeg',
          },
          // Add more job cards for App Developer category as needed
        ];
      // Add cases for other categories if necessary
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return jobCards.isNotEmpty
        ? ListView.builder(
            itemCount: jobCards.length,
            itemBuilder: (context, index) {
              final job = jobCards[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 0, top: 60),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: const Color(0xff212121),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 94,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            image: NetworkImage(job['imageURL']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                job['title'],
                                maxLines: 2,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Salary \$${job['startingPrice']}',
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                  'Location: ${job['location']}',
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        : const Center(
            child: Text('No jobs available for this category'),
          );
  }
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
                category: 'Data Scientist',
              ),
              GigCategoryTab(
                category: 'Software Developer',
              ),
              GigCategoryTab(
                category: 'App Developer',
              ),
              GigCategoryTab(
                category: 'Machine Learning Engineer',
              ),
              GigCategoryTab(
                category: 'Artificial Intelligence Engineer',
              ),
              GigCategoryTab(
                category: 'Embedded Systems Engineer',
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
