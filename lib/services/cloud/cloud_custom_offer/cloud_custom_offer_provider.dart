// 2

import 'package:alumni_connect/services/cloud/cloud_custom_offer/cloud_custom_offer.dart';

abstract class CloudCustomOfferProvider {
  Future<void> createNewCustomOffer(CloudCustomOffer cloudCustomOffer);

  Future<String> deleteOffer(String orderId);

  Stream<Iterable<CloudCustomOffer>> userAllReceivedOffers(String userId);

  Stream<Iterable<CloudCustomOffer>> userAllSentOffers(String userId);
}
