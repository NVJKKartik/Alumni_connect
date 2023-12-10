// 4
import 'package:alumni_connect/services/cloud/cloud_jobposting/cloud_jobposting.dart';
import 'package:alumni_connect/services/cloud/cloud_jobposting/cloud_jobposting_provider.dart';
import 'package:alumni_connect/services/cloud/cloud_jobposting/firebase_cloud_jobposting_provder.dart';

class CloudjobpostingService implements CloudjobpostingProvider {
  final CloudjobpostingProvider provider;

  const CloudjobpostingService(this.provider);

  factory CloudjobpostingService.firebase() =>
      CloudjobpostingService(FirebaseCloudjobpostingProvider());

  @override
  Future<void> createNewjobposting(Cloudjobposting cloudjobposting) =>
      provider.createNewjobposting(cloudjobposting);

  @override
  Stream<Iterable<Cloudjobposting>> jobpostingsByCategory(String category) =>
      provider.jobpostingsByCategory(category);

  @override
  Future<List<Cloudjobposting>> searchjobpostings(String keyword) =>
      provider.searchjobpostings(keyword);

  @override
  Stream<Iterable<Cloudjobposting>> userAlljobpostings(String userId) =>
      provider.userAlljobpostings(userId);

  @override
  Stream<Iterable<Cloudjobposting>> alljobpostings() =>
      provider.alljobpostings();
}
