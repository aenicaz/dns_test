// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:dns_test/external_api/external_api.dart';
import 'package:test/test.dart' as native_test;


void main() {
  native_test.test('Counter increments smoke test', () async {
    var userData = UserData(
      phone: '33333333',
      lastName: 'test',
      patronymic: 'test',
      firstName: 'test',
      email: 'test@mail.test'
    );
    var response = await DataFetcher.getToken(userData);

    print(response.data);

    var testRequest = CandidateRequests(
      user: userData,
      summary: 'https://vladivostok.hh.ru/resume/c9489981ff0845ef630039ed1f777147775462',
      githubProfileUrl: 'https://github.com/aenicaz',
    );
    var finalResponse = await DataFetcher.sendRequest(response.data, testRequest);

      if (finalResponse.code != 0)
        print(finalResponse.toJson());
  });
}
