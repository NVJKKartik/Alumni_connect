// 2
import 'package:alumni_connect/services/cloud/cloud_jobposting/cloud_jobposting.dart';

abstract class CloudjobpostingProvider {
  Future<void> createNewjobposting(Cloudjobposting cloudjobposting);

  Future<List<Cloudjobposting>> searchjobpostings(String keyword);

  Stream<Iterable<Cloudjobposting>> jobpostingsByCategory(String category);

  Stream<Iterable<Cloudjobposting>> userAlljobpostings(String userId);

  Stream<Iterable<Cloudjobposting>> alljobpostings();
}
