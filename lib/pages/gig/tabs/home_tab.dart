import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // Define a list of constant job cards
  final List<Map<String, dynamic>> jobCards = [
    {
      'title': 'Software Developer',
      'startingPrice': 50000,
      'rating': 4.5,
      'imageURL':
          'https://res.cloudinary.com/highereducation/images/f_auto,q_auto/v1673376079/ComputerScience.org/how-to-become-a-software-dev/how-to-become-a-software-dev.jpg?_i=AA', // Replace with actual image URL
    },
    // Add more job cards as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: CustomScrollView(
        slivers: [
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 18,
                              top: 12,
                              right: 18,
                            ),
                            child: Container(
                              height: 389,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment(1, 0.0),
                                  colors: <Color>[
                                    Color(0xFF9288E4),
                                    Color(0xFF534EA7),
                                  ],
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 15,
                                    left: 11,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 39,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFAFA8EE),
                                        borderRadius: BorderRadius.circular(36),
                                      ),
                                      child: const Text(
                                        'Welcome to CGC IIIT Dharwad',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 80,
                                    left: 14,
                                    child: Text(
                                      'Explore upcoming Jobs and \nInternship Opportunity',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Image.asset(
                                      'assets/images/img_saly10.png',
                                      scale: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 78,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 26, 16, 16),
                              child: RichText(
                                text: const TextSpan(
                                  text: 'Trending Jobs and Internships',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600),
                                  children: [
                                    TextSpan(
                                      text: '\nOver 50+ locations',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

          // Add a SliverList for the constant job cards
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 90),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final job = jobCards[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: InkWell(
                      onTap: () {
                        // Handle job card tap
                      },
                      child: Container(
                        height: 94,
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
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  right: 2,
                                ),
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
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    RatingBar.builder(
                                      minRating: 1,
                                      maxRating: 5,
                                      initialRating: job['rating'],
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemSize: 18,
                                      allowHalfRating: true,
                                      itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1,
                                      ),
                                      itemBuilder: (context, index) {
                                        return const Icon(
                                          Icons.star,
                                          color: Color(0xfff4c465),
                                        );
                                      },
                                      onRatingUpdate: ((value) =>
                                          print('rating')),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: jobCards.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
