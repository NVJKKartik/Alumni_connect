import 'package:alumni_connect/pages/order/order_success_page.dart';
import 'package:alumni_connect/services/auth/auth_service.dart';
import 'package:alumni_connect/services/cloud/cloud_jobposting/cloud_jobposting.dart';
import 'package:alumni_connect/services/cloud/cloud_order/cloud_order.dart';
import 'package:alumni_connect/services/cloud/cloud_order/cloud_order_service.dart';
import 'package:alumni_connect/services/cloud/cloud_user/cloud_user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';


class PostCard extends StatelessWidget {
  final String postUrl;
  final String profileUrl;
  final String userName;
  final String profession;
  const PostCard(
      {Key? key,
      required this.profileUrl,
      required this.postUrl,
      required this.userName,
      required this.profession})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 550,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(36),
        ),
        color: Colors.white,
        image:
            DecorationImage(fit: BoxFit.cover, image: FileImage(File(postUrl))),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(profileUrl),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(profession)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 15,
            right: 20,
            child: TextField(
              // controller: _captionController,
              maxLines: 2,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Caption your shot.',
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key, required this.cloudjobposting});
  final Cloudjobposting cloudjobposting;

  @override
  State<CheckoutPage> createState() => _CheckoutPage();
}

class _CheckoutPage extends State<CheckoutPage> {
  late final TextEditingController _projectRequirementController;

  final currentUser = AuthService.firebase().currentUser!;
  String get employerId => currentUser.id;

  @override
  void initState() {
    _projectRequirementController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _projectRequirementController.dispose();
    super.dispose();
  }

  Future<void> createOrder() async {
    String orderId = const Uuid().v1();

    final employer =
        await CloudUserService.firebase().getUser(userId: employerId);

    CloudOrder cloudOrder = CloudOrder(
      orderId: orderId,
      userId: widget.cloudjobposting.userId,
      jobpostingId: widget.cloudjobposting.jobpostingId,
      jobpostingTitle: widget.cloudjobposting.jobpostingTitle,
      jobpostingCoverUrl: widget.cloudjobposting.jobpostingCoverUrl,
      employerId: employerId,
      employerName: employer!.fullName,
      employerProfileUrl: employer.profileUrl!,
      jobpostingPrice: widget.cloudjobposting.jobpostingStartingPrice,
      serviceSpecifications: widget.cloudjobposting.serviceSpecifications,
      serviceCharge:
          widget.cloudjobposting.jobpostingStartingPrice.toDouble() * 0.1,
      totalPrice: widget.cloudjobposting.jobpostingStartingPrice +
          (widget.cloudjobposting.jobpostingStartingPrice).toDouble() * 0.1,
      projectRequirement: _projectRequirementController.text,
      createdAt: DateTime.now(),
      deliveryTime: widget.cloudjobposting.deliveryTime,
    );
    CloudOrderService.firebase().createNewOrder(cloudOrder);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            centerTitle: false,
            elevation: 0,
            backgroundColor: Colors.black,
            title: const Text(
              'Submit Application',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(102.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  height: 94, //check
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
                            image: NetworkImage(
                              widget.cloudjobposting.jobpostingCoverUrl,
                            ),
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
                                widget.cloudjobposting.jobpostingTitle,
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
                              const SizedBox(
                                height: 2,
                              ),
                              RatingBar.builder(
                                minRating: 1,
                                maxRating: 5,
                                initialRating:
                                    widget.cloudjobposting.jobpostingRating,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize: 18,
                                allowHalfRating: true,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1),
                                itemBuilder: (context, index) {
                                  return const Icon(
                                    Icons.star,
                                    color: Color(0xfff4c465),
                                  );
                                },
                                // ignore: avoid_print
                                onRatingUpdate: ((value) => print('rating')),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                decoration: BoxDecoration(
                  color: const Color(0xff242424),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Application Details',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/credit-card.png',
                            height: 38,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Personal Details',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 2.0,
                              bottom: 3.0,
                            ),
                            child: Text(
                              'Mobile Number',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Colors.black,
                              contentPadding: const EdgeInsets.all(8),
                              hintText: '10 Digit Phone Number',
                              enabled: true,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              fillColor: Colors.black,
                              contentPadding: const EdgeInsets.all(8),
                              hintText: 'Applicant\'s name',
                              enabled: true,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 2.0,
                                  bottom: 3.0,
                                ),
                                child: Text(
                                  'Year of Graduation',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    fillColor: Colors.black,
                                    contentPadding: const EdgeInsets.all(8),
                                    hintText: 'MM/YY',
                                    enabled: true,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const VerticalDivider(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 2.0,
                                  bottom: 3.0,
                                ),
                                child: Text(
                                  'Roll Number',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    fillColor: Colors.black,
                                    contentPadding: const EdgeInsets.all(8),
                                    hintText: '21BDS069',
                                    enabled: true,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                decoration: BoxDecoration(
                  color: const Color(0xff242424),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Requirements',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 2.0,
                              bottom: 3.0,
                            ),
                          ),
                          TextField(
                            controller: _projectRequirementController,
                            keyboardType: TextInputType.text,
                            maxLines: 8,
                            decoration: InputDecoration(
                              fillColor: Colors.black,
                              contentPadding: const EdgeInsets.all(8),
                              hintText: 'Specify your requirements',
                              enabled: true,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                decoration: BoxDecoration(
                  color: const Color(0xff242424),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Send your Resume here: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Handle file attachment logic
                        // You may want to use a file picker here
                        // For simplicity, let's assume _attachFile method
                        // is responsible for handling file attachment.
                        _attachFile();
                      },
                      child: const Text('Attach File'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 109),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(140, 48),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                onPressed: () {
                  createOrder();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderSuccessPage(),
                    ),
                  );
                },
                child: const Text(
                  'Send Application',
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
void _attachFile() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Get the selected file
      PlatformFile file = result.files.first;

      // Process the selected file (you can save it, display its details, etc.)
      print('File picked: ${file.name}');
      print('File path: ${file.path}');
      
      // You may want to save the file path or perform further actions with the file.
    } else {
      // User canceled the file picker
      print('File picking canceled.');
    }
  } catch (e) {
    print('Error picking file: $e');
  }
}
