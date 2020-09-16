import 'dart:io';
import 'dart:convert';

import 'url.dart';

class UserData{
  String firstName;
  String lastName;
  String phone;
  String email;
  String patronymic;


  UserData({
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.patronymic,
  });

  factory UserData.fromJson(Map data) => UserData(
    email: data['email'],
    firstName: data['firstName'],
    lastName: data['lastName'],
    phone: data['phone'],
    patronymic: data ['patronymic']
  );

  Map<String, dynamic> toJson() => {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'patronymic' : patronymic,
  };
}

class TokenAnswer{
  int code;
  String message;

  TokenAnswer({
    this.code,
    this.message,
  });
  factory TokenAnswer.fromJson(Map data) => TokenAnswer(
      code: data['code'],
      message: data['message'],
  );
  Map<String, dynamic> toJson() => {
    'code': code,
    'message': message,
  };
}

class TestAnswer{
  int code;
  String message;
  String  data;


  TestAnswer({
    this.code,
    this.message,
    this.data,
  });
  factory TestAnswer.fromJson(Map data) => TestAnswer(
      code: data['code'],
      message: data['message'],
      data: data['data'],
  );
  Map<String, dynamic> toJson() => {
    'code': code,
    'message': message,
    'data' : data,
  };
}

class CandidateRequests{
  UserData user;
  String githubProfileUrl;
  String summary;


  CandidateRequests({
    this.user,
    this.githubProfileUrl,
    this.summary,
  });

  factory CandidateRequests.fromJson(Map data) => CandidateRequests(
    user: UserData.fromJson(data),
    githubProfileUrl: data['githubProfileUrl'],
    summary: data['summary'],
  );

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{
      'githubProfileUrl': githubProfileUrl,
      'summary': summary,
    };

    data.addAll(user.toJson());
    return data;
  }
}

class DataFetcher{
  static Future<TestAnswer> getToken(UserData userData) async {
    HttpClient client = HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request = await client.postUrl(Uri.parse(UrlData.token));
    request.headers.set('Content-Type', 'application/json; charset=UTF-8');
    request.add(utf8.encode(json.encode(userData.toJson())));

    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();

    return TestAnswer.fromJson(json.decode(reply));
  }

  static Future<TokenAnswer> sendRequest(String token, CandidateRequests candidate) async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request = await client.postUrl(Uri.parse(UrlData.summary));
    request.headers.add(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.add(HttpHeaders.authorizationHeader, 'Bearer $token');
    request.add(utf8.encode(json.encode(candidate.toJson())));

    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();

    return TokenAnswer.fromJson(json.decode(reply));
  }
}
