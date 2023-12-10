import 'package:alumni_connect/pages/jobposting_details/jobposting_details_page.dart';
import 'package:alumni_connect/services/cloud/cloud_jobposting/cloud_jobposting.dart';
import 'package:alumni_connect/services/cloud/cloud_jobposting/cloud_jobposting_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class jobpostingCategoryTab extends StatefulWidget {
  const jobpostingCategoryTab({super.key, required this.category});
  final String category;

  @override
  State<jobpostingCategoryTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<jobpostingCategoryTab> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: CloudjobpostingService.firebase()
          .jobpostingsByCategory(widget.category),
      builder: (BuildContext context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            if (snapshot.hasData) {
              final alljobpostings = snapshot.data as Iterable<Cloudjobposting>;
              if (alljobpostings.isEmpty) {
                return Center(
                  child: Image.asset(
                    'assets/icons/nothing.png',
                    height: 68,
                    color: Colors.white,
                  ),
                );
              }
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      slivers: [
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context,
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.only(top: 12, bottom: 90),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              childCount: alljobpostings.length,
                              (context, index) {
                                final jobposting =
                                    alljobpostings.elementAt(index);
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              jobpostingDetailsPage(
                                                  cloudjobposting: jobposting),
                                        ),
                                      );
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
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  jobposting.jobpostingCoverUrl,
                                                ),
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    jobposting.jobpostingTitle,
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    'Salary \$${jobposting.jobpostingStartingPrice}',
                                                    style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 2,
                                                  ),
                                                  RatingBar.builder(
                                                    minRating: 1,
                                                    maxRating: 5,
                                                    initialRating: jobposting
                                                        .jobpostingRating,
                                                    direction: Axis.horizontal,
                                                    itemCount: 5,
                                                    itemSize: 18,
                                                    allowHalfRating: true,
                                                    itemPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                      horizontal: 1,
                                                    ),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return const Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xfff4c465),
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
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text('No Recommendation'),
              );
            }
          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
