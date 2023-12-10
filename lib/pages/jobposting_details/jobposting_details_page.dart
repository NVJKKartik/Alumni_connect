import 'package:alumni_connect/pages/jobposting_details/send_custom_offer.dart';
import 'package:alumni_connect/pages/jobposting_details/team_members_account_page.dart';
import 'package:alumni_connect/pages/order/checkout_page.dart';
import 'package:alumni_connect/services/auth/auth_service.dart';
import 'package:alumni_connect/services/cloud/cloud_jobposting/cloud_jobposting.dart';
import 'package:alumni_connect/services/cloud/cloud_user/cloud_user.dart';
import 'package:alumni_connect/services/cloud/cloud_user/cloud_user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class jobpostingDetailsPage extends StatefulWidget {
  const jobpostingDetailsPage({
    super.key,
    required this.cloudjobposting,
  });
  final Cloudjobposting cloudjobposting;

  @override
  State<jobpostingDetailsPage> createState() => _jobpostingDetailsPageState();
}

class _jobpostingDetailsPageState extends State<jobpostingDetailsPage> {
  final currentUser = AuthService.firebase().currentUser!;
  String get userId => currentUser.id;

  List<CloudUser> teamMembers = [];
  bool isLoading = false;

  @override
  void initState() {
    getAllTeamMembers();
    super.initState();
  }

  Future<void> getAllTeamMembers() async {
    setState(() {
      isLoading = true;
    });
    final teamMembersId = widget.cloudjobposting.teamMembers;
    for (String memberId in teamMembersId) {
      CloudUser? cloudUser =
          await CloudUserService.firebase().getUser(userId: memberId);
      if (cloudUser != null) {
        teamMembers.add(cloudUser);
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 392,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                child: Image.network(
                  widget.cloudjobposting.jobpostingCoverUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 22,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBar.builder(
                    initialRating: widget.cloudjobposting.jobpostingRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 18,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Color(0xFFF4C465),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    widget.cloudjobposting.jobpostingTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      !isLoading
                          ? Row(
                              children: [
                                SizedBox(
                                  // width: 200,
                                  height: 45,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(right: 32),
                                    scrollDirection: Axis.horizontal,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: teamMembers.length,
                                    itemBuilder: (context, index) {
                                      final teamMember = teamMembers[index];
                                      return Align(
                                        widthFactor: 0.4,
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                teamMember.profileUrl!,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  '${widget.cloudjobposting.teamMembers.length.toString()}+ Members',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFCACACA),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(54, 47),
                          backgroundColor: const Color(0xff242424),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeamMembersAccountPage(
                                teamMembers: teamMembers,
                              ),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/icons/right-arrow.png',
                          color: Colors.white,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 28),
              child: Container(
                padding: const EdgeInsets.fromLTRB(22, 16, 22, 16),
                decoration: BoxDecoration(
                  color: const Color(0xff242424),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cloudjobposting.jobpostingDescription,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                padding: const EdgeInsets.fromLTRB(22, 16, 22, 16),
                decoration: BoxDecoration(
                  color: const Color(0xff242424),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Service specifications :',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Divider(),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount:
                          widget.cloudjobposting.serviceSpecifications.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final service =
                            widget.cloudjobposting.serviceSpecifications[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${service['specificationName']}:',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                service['shortDetail'],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 109),
              child: (widget.cloudjobposting.userId != userId)
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(140, 48),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutPage(
                              cloudjobposting: widget.cloudjobposting,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Continue (\$${widget.cloudjobposting.jobpostingStartingPrice.toString()})',
                        style: const TextStyle(fontSize: 18),
                      ),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(140, 48),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SendCustomeOfferPage(
                                    cloudjobposting: widget.cloudjobposting,
                                  )),
                        );
                      },
                      child: const Text(
                        'Send custom offer',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
