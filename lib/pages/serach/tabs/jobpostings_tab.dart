import 'package:alumni_connect/pages/jobposting_details/jobposting_details_page.dart';
import 'package:alumni_connect/services/cloud/cloud_jobposting/cloud_jobposting.dart';
import 'package:alumni_connect/services/cloud/cloud_jobposting/cloud_jobposting_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class jobpostingsTab extends StatefulWidget {
  const jobpostingsTab({super.key, required this.keyword});
  final String keyword;

  @override
  State<jobpostingsTab> createState() => _jobpostingsTabState();
}

class _jobpostingsTabState extends State<jobpostingsTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          CloudjobpostingService.firebase().searchjobpostings(widget.keyword),
      builder: (BuildContext context,
          AsyncSnapshot<List<Cloudjobposting>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData) {
              final searchjobpostings = snapshot.data;
              if (searchjobpostings!.isEmpty) {
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
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: searchjobpostings.length,
                            (context, index) {
                              final userjobposting = searchjobpostings[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            jobpostingDetailsPage(
                                          cloudjobposting: userjobposting,
                                        ),
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
                                                userjobposting
                                                    .jobpostingCoverUrl,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12, right: 8),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  userjobposting
                                                      .jobpostingTitle,
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  'From \$${userjobposting.jobpostingStartingPrice}',
                                                  style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.grey),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                RatingBar.builder(
                                                  minRating: 1,
                                                  maxRating: 5,
                                                  initialRating: userjobposting
                                                      .jobpostingRating,
                                                  direction: Axis.horizontal,
                                                  itemCount: 5,
                                                  itemSize: 18,
                                                  allowHalfRating: true,
                                                  itemPadding: const EdgeInsets
                                                      .symmetric(horizontal: 1),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return const Icon(
                                                      Icons.star,
                                                      color: Color(0xfff4c465),
                                                    );
                                                  },
                                                  onRatingUpdate: ((value) =>
                                                      print('rating')),
                                                )
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
                      ],
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text('jobposting Not found'),
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
