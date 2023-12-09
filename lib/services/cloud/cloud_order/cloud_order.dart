import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alumni_connect/services/cloud/cloud_storage_constants.dart';
import 'package:flutter/material.dart';

@immutable
class CloudOrder {
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
  final String projectRequirement;
  final List serviceSpecifications;
  final String? deliveryMessage;
  final String? filePathUrl;
  final bool isdelivered;
  final bool isOrderAccepted;
  final bool isOrderRejected;
  final bool isDeliveryAccepted;
  final DateTime createdAt;
  final String deliveryTime;

  const CloudOrder({
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
    this.projectRequirement = '',
    required this.serviceSpecifications,
    this.isOrderAccepted = false,
    this.isOrderRejected = false,
    this.deliveryMessage = '',
    this.filePathUrl = '',
    this.isdelivered = false,
    this.isDeliveryAccepted = false,
    required this.createdAt,
    required this.deliveryTime,
  });

  CloudOrder.fromJson(Map<String, dynamic> json)
      : orderId = json[orderIdFieldName],
        userId = json[userIdFieldName],
        jobpostingId = json[jobpostingIdFieldName],
        jobpostingCoverUrl = json[jobpostingCoverUrlFieldName],
        jobpostingTitle = json[jobpostingTitleFieldName],
        employerName = json[employerNameFieldName],
        employerId = json[employerIdFieldName],
        employerProfileUrl = json[employerProfileUrlFieldName],
        jobpostingPrice = json[jobpostingPriceFieldName],
        serviceCharge = json[serviceChargeFieldName],
        totalPrice = json[totalPriceFieldName],
        projectRequirement = json[projectRequirementFieldName],
        serviceSpecifications = json[serviceSpecificationsFieldName],
        deliveryMessage = json[deliveryMessageFieldName],
        filePathUrl = json[filePathUrlFieldName],
        isOrderAccepted = json[isOrderAcceptedFieldName],
        isOrderRejected = json[isOrderRejectedFieldName],
        isdelivered = json[isDeliveredFieldName],
        isDeliveryAccepted = json[isDeliveryAcceptedFieldName],
        createdAt = json[createdAtFieldName],
        deliveryTime = json[deliveryTimeFieldName];

  CloudOrder.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
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
        projectRequirement =
            snapshot.data()[projectRequirementFieldName] as String,
        serviceSpecifications =
            snapshot.data()[serviceSpecificationsFieldName] as List,
        deliveryMessage = snapshot.data()[deliveryMessageFieldName] as String,
        filePathUrl = snapshot.data()[filePathUrlFieldName] as String,
        isOrderAccepted = snapshot.data()[isOrderAcceptedFieldName] as bool,
        isOrderRejected = snapshot.data()[isOrderRejectedFieldName] as bool,
        isdelivered = snapshot.data()[isDeliveredFieldName] as bool,
        isDeliveryAccepted =
            snapshot.data()[isDeliveryAcceptedFieldName] as bool,
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
        projectRequirementFieldName: projectRequirement,
        serviceSpecificationsFieldName: serviceSpecifications,
        deliveryMessageFieldName: deliveryMessage,
        filePathUrlFieldName: filePathUrl,
        isOrderAcceptedFieldName: isOrderAccepted,
        isOrderRejectedFieldName: isOrderRejected,
        isDeliveredFieldName: isdelivered,
        isDeliveryAcceptedFieldName: isDeliveryAccepted,
        createdAtFieldName: createdAt.toIso8601String(),
        deliveryTimeFieldName: deliveryTime,
      };

  @override
  bool operator ==(covariant CloudOrder other) => jobpostingId == other.orderId;

  @override
  int get hashCode => orderId.hashCode;
}
