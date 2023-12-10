import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alumni_connect/services/cloud/cloud_storage_constants.dart';
import 'package:flutter/material.dart';

@immutable
class Cloudjobposting {
  final String userId;
  final String jobpostingId;
  final double jobpostingRating;
  final String jobpostingCoverUrl;
  final String jobpostingTitle;
  final String jobpostingCategory;
  final String jobpostingDescription;
  final List<dynamic> teamMembers;
  final List serviceSpecifications;
  final double jobpostingStartingPrice;
  final String deliveryTime;
  final DateTime createdAt;

  const Cloudjobposting({
    required this.userId,
    required this.jobpostingId,
    required this.jobpostingRating,
    required this.jobpostingCoverUrl,
    required this.jobpostingTitle,
    required this.jobpostingCategory,
    required this.jobpostingDescription,
    required this.teamMembers,
    required this.serviceSpecifications,
    required this.jobpostingStartingPrice,
    required this.deliveryTime,
    required this.createdAt,
  });

  Cloudjobposting.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : userId = snapshot.data()[userIdFieldName],
        jobpostingId = snapshot.data()[jobpostingIdFieldName],
        jobpostingRating = snapshot.data()[jobpostingRatingFieldName] as double,
        jobpostingCoverUrl =
            snapshot.data()[jobpostingCoverUrlFieldName] as String,
        jobpostingTitle = snapshot.data()[jobpostingTitleFieldName] as String,
        jobpostingCategory =
            snapshot.data()[jobpostingCategoryFieldName] as String,
        jobpostingDescription =
            snapshot.data()[jobpostingDescriptionFieldName] as String,
        teamMembers = snapshot.data()[teamMembersFieldName] as List<dynamic>,
        serviceSpecifications =
            snapshot.data()[serviceSpecificationsFieldName] as List,
        jobpostingStartingPrice =
            snapshot.data()[jobpostingStartingPriceFieldName] as double,
        deliveryTime = snapshot.data()[deliveryTimeFieldName] as String,
        createdAt =
            DateTime.parse(snapshot.data()[createdAtFieldName] as String);

  Map<String, dynamic> toJson() => {
        userIdFieldName: userId,
        jobpostingIdFieldName: jobpostingId,
        jobpostingRatingFieldName: jobpostingRating,
        jobpostingCoverUrlFieldName: jobpostingCoverUrl,
        jobpostingTitleFieldName: jobpostingTitle,
        jobpostingCategoryFieldName: jobpostingCategory,
        jobpostingDescriptionFieldName: jobpostingDescription,
        teamMembersFieldName: teamMembers,
        serviceSpecificationsFieldName: serviceSpecifications,
        jobpostingStartingPriceFieldName: jobpostingStartingPrice,
        deliveryTimeFieldName: deliveryTime,
        createdAtFieldName: createdAt.toIso8601String(),
      };

  @override
  bool operator ==(covariant Cloudjobposting other) =>
      jobpostingId == other.jobpostingId;

  @override
  int get hashCode => jobpostingId.hashCode;
}
