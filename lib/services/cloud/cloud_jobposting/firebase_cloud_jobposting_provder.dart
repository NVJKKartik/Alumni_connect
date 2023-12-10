import 'package:alumni_connect/services/cloud/cloud_jobposting/cloud_jobposting.dart';
import 'package:alumni_connect/services/cloud/cloud_jobposting/cloud_jobposting_provider.dart';
import 'package:alumni_connect/services/cloud/firebase_cloud_storage.dart';

class FirebaseCloudjobpostingProvider extends CloudjobpostingProvider {
  FirebaseCloudStorage firebaseCloudStorage = FirebaseCloudStorage();

  final _jobpostings = 'jobpostings';

  @override
  Future<void> createNewjobposting(Cloudjobposting cloudjobposting) async {
    await firebaseCloudStorage
        .firebaseFirestoreInstance()
        .collection(_jobpostings)
        .doc(cloudjobposting.jobpostingId)
        .set(
          cloudjobposting.toJson(),
        );
  }

  @override
  Stream<Iterable<Cloudjobposting>> jobpostingsByCategory(String category) {
    return firebaseCloudStorage
        .firebaseFirestoreInstance()
        .collection(_jobpostings)
        .where('jobposting_category', isEqualTo: category)
        .snapshots()
        .map(
          (event) => event.docs.map(
            (doc) => Cloudjobposting.fromSnapshot(doc),
          ),
        );
  }

  @override
  Future<List<Cloudjobposting>> searchjobpostings(String keyword) {
    if (keyword.isNotEmpty) {
      return firebaseCloudStorage
          .firebaseFirestoreInstance()
          .collection(_jobpostings)
          .where('jobposting_title',
              isGreaterThanOrEqualTo: keyword.toUpperCase())
          .get()
          .then(
            (querySnapshot) => querySnapshot.docs
                .map(
                  (doc) => Cloudjobposting.fromSnapshot(doc),
                )
                .toList(),
          );
    } else {
      return firebaseCloudStorage
          .firebaseFirestoreInstance()
          .collection(_jobpostings)
          .get()
          .then(
            (querySnapshot) => querySnapshot.docs
                .map(
                  (doc) => Cloudjobposting.fromSnapshot(doc),
                )
                .toList(),
          );
    }
  }

  @override
  Stream<Iterable<Cloudjobposting>> userAlljobpostings(String userId) {
    return firebaseCloudStorage
        .firebaseFirestoreInstance()
        .collection(_jobpostings)
        .where('user_id', isEqualTo: userId)
        .snapshots()
        .map(
          (event) => event.docs.map(
            (doc) => Cloudjobposting.fromSnapshot(doc),
          ),
        );
  }

  @override
  Stream<Iterable<Cloudjobposting>> alljobpostings() => firebaseCloudStorage
      .firebaseFirestoreInstance()
      .collection(_jobpostings)
      .snapshots()
      .map(
        (event) => event.docs.map(
          (doc) => Cloudjobposting.fromSnapshot(doc),
        ),
      );
}
