import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:dns_test/external_api/internal/api_manager.dart';
import 'package:dns_test/external_api/internal/api_client.dart';
part 'home_page_text_data_state.dart';

class HomePageTextDataCubit extends Cubit<HomePageTextDataState> {

  String firstName = '';
  String lastName = '';
  String patronymic = '';
  String email = '';
  String phone = '';

  void firstNameChanged(String value) {
    firstName = value;
  }

  void lastNameChanged(String value) {
    lastName = value;
  }

  void patronymicChanged(String value) {
    patronymic = value;
  }

  void emailChanged(String value) {
    email = value;
  }

  void phoneChanged(String value) {
    phone = value;
  }

  void requestData() async {

    emit(HomePageLoading());

    ApiClient.userData = UserData(
      firstName: firstName,
      lastName: lastName,
      patronymic: patronymic,
      email: email,
      phone:phone,
    );

    var response = await DataFetcher.getToken(ApiClient.userData);
    ApiClient.apiToken = response.data;
    print('Token ');
    print(response.data);

    if (ApiClient.apiToken != null) {
        emit(HomePageSuccess());
    } else {
        emit(HomePageError());
    }
  }

  HomePageTextDataCubit() : super(HomePageTextDataInitial());
}
