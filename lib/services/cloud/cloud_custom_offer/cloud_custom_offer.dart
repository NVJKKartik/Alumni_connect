import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alumni_connect/services/cloud/cloud_storage_constants.dart';
import 'package:flutter/material.dart';

@immutable
class CloudCustomOffer {
  final String orderId;
  final String userId;
  final String jobpostingId;
  final String jobpostingCoverUrl;
  final String employerName;
  final String employerProfileUrl;
  final String jobpostingTitle;
  final String employerId;
  final double jobpostingPrice;
  final double serviceCharge;
  final double totalPrice;
  final List serviceSpecifications;
  final DateTime createdAt;
  final String deliveryTime;

  const CloudCustomOffer({
    required this.orderId,
    required this.userId,
    required this.jobpostingId,
    required this.jobpostingTitle,
    required this.jobpostingCoverUrl,
    required this.employerName,
    required this.employerProfileUrl,
    required this.employerId,
    required this.jobpostingPrice,
    required this.serviceCharge,
    required this.totalPrice,
    required this.serviceSpecifications,
    required this.createdAt,
    required this.deliveryTime,
  });

  CloudCustomOffer.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : orderId = snapshot.data()[orderIdFieldName],
        userId = snapshot.data()[userIdFieldName],
        jobpostingId = snapshot.data()[jobpostingIdFieldName],
        jobpostingCoverUrl =
            snapshot.data()[jobpostingCoverUrlFieldName] as String,
        jobpostingTitle = snapshot.data()[jobpostingTitleFieldName] as String,
        employerName = snapshot.data()[employerNameFieldName] as String,
        employerProfileUrl =
            snapshot.data()[employerProfileUrlFieldName] as String,
        employerId = snapshot.data()[employerIdFieldName],
        jobpostingPrice = snapshot.data()[jobpostingPriceFieldName] as double,
        serviceCharge = snapshot.data()[serviceChargeFieldName] as double,
        totalPrice = snapshot.data()[totalPriceFieldName] as double,
        serviceSpecifications =
            snapshot.data()[serviceSpecificationsFieldName] as List,
        createdAt =
            DateTime.parse(snapshot.data()[createdAtFieldName] as String),
        deliveryTime = snapshot.data()[deliveryTimeFieldName] as String;

  Map<String, dynamic> toJson() => {
        orderIdFieldName: orderId,
        userIdFieldName: userId,
        jobpostingIdFieldName: jobpostingId,
        jobpostingTitleFieldName: jobpostingTitle,
        jobpostingCoverUrlFieldName: jobpostingCoverUrl,
        employerNameFieldName: employerName,
        employerProfileUrlFieldName: employerProfileUrl,
        employerIdFieldName: employerId,
        jobpostingPriceFieldName: jobpostingPrice,
        serviceChargeFieldName: serviceCharge,
        totalPriceFieldName: totalPrice,
        serviceSpecificationsFieldName: serviceSpecifications,
        createdAtFieldName: createdAt.toIso8601String(),
        deliveryTimeFieldName: deliveryTime,
      };

  @override
  bool operator ==(covariant CloudCustomOffer other) =>
      jobpostingId == other.orderId;

  @override
  int get hashCode => orderId.hashCode;
}
