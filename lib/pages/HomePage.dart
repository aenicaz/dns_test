import 'package:dns_test/external_api/internal/api_client.dart';
import 'package:flutter/material.dart';

import 'package:dns_test/external_api/external_api.dart';

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
        content: new Text("Данные введены не верно"),
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
                SizedBox(
                  width: 380,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: TextField(
                      controller: etLastName,
                      decoration: new InputDecoration(
                        hintText: 'Фамилия',
                      ),
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: 380,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      child: TextField(
                        controller: etFirstName,
                        decoration: new InputDecoration(
                          hintText: 'Имя',
                        ),
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    )
                ),
                SizedBox(
                  width: 380,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: TextField(
                      controller: etPatronymic,
                      decoration: new InputDecoration(
                        hintText: 'Отчество',
                      ),
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 380,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: TextField(
                      controller: etEmail,
                      decoration: new InputDecoration(
                        hintText: 'E-mail',
                      ),
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 380,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: TextField(
                      controller: etPhone,
                      decoration: new InputDecoration(
                        hintText: 'Телефон',
                      ),
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
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
