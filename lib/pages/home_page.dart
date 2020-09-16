import 'package:dns_test/external_api/internal/api_client.dart';
import 'package:flutter/material.dart';

import 'package:dns_test/external_api/external_api.dart';
import 'widgets/custom_input_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController etFirstName = new TextEditingController();
  TextEditingController etLastName = new TextEditingController();
  TextEditingController etPatronymic = new TextEditingController();
  TextEditingController etEmail = new TextEditingController();
  TextEditingController etPhone = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _showSnackBar(){
    final snackBar = new SnackBar(
        content: new Text("Данные введены неверно"),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _requestData() async{
    ApiClient.userData = UserData(
      firstName: etFirstName.text,
      lastName: etLastName.text,
      patronymic: etPatronymic.text,
      email: etEmail.text,
      phone: etPhone.text,
    );

    var response = await DataFetcher.getToken(ApiClient.userData);
    ApiClient.apiToken = response.data;
    print('Token ');
    print(response.data);

    if(ApiClient.apiToken != null) {
      Navigator.pushNamed(context, '/SecondPage');
    }else {
      _showSnackBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  height: 38,
                  width: 400,
                  image: AssetImage('assets/pictures/800px-DNS_logo.png'),
                ),
                CustomInputField(
                  hintText: 'Фамилия',
                  textEditingController: etLastName,
                ),
                CustomInputField(
                  hintText: 'Имя',
                  textEditingController: etFirstName,
                ),
                CustomInputField(
                  hintText: 'Отчество',
                  textEditingController: etPatronymic,
                ),
                CustomInputField(
                  hintText: 'E-mail',
                  textEditingController: etEmail,
                ),
                CustomInputField(
                  hintText: 'Телефон',
                  textEditingController: etPhone,
                ),
                FlatButton(
                  color: Colors.orange.shade600,
                  textColor: Colors.grey.shade200,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.orange.shade300,
                  onPressed: (){
                    _requestData();
                  },
                  child: Text(
                    "Получить ключ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
