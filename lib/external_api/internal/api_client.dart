

import 'package:dns_test/external_api/external_api.dart';

class ApiClient{
  static var userData = new UserData();
  static var candidateRequest = new CandidateRequests( user: userData);

  static var apiToken;
}