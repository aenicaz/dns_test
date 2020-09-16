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

  String teststr = '';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 38,
              width: 400,
              image: AssetImage('assets/pictures/800px-DNS_logo.png'),
            ),
            Text(
                teststr
            ),
            Card(
                margin: EdgeInsets.fromLTRB(25,32, 25, 0),
                elevation: 2,
                child: SizedBox(
                  width: 400,
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
                  ),
                )
            ),
            SizedBox( height: 10,),
            Card(
                margin: EdgeInsets.symmetric( horizontal: 25),
                elevation: 2,
                child: SizedBox(
                  width: 400,
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
                )
            ),
            SizedBox( height: 10,),
            Card(
                margin: EdgeInsets.symmetric(horizontal: 25),
                elevation: 2,
                child: SizedBox(
                  width: 400,
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
                )
            ),
            SizedBox( height: 10,),
            Card(
                margin: EdgeInsets.symmetric(horizontal: 25),
                elevation: 2,
                child: SizedBox(
                  width: 400,
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
                )
            ),
            SizedBox( height: 10,),
            Card(
                margin: EdgeInsets.symmetric(horizontal: 25),
                elevation: 2,
                child: SizedBox(
                  width: 400,
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
                )
            ),
            SizedBox( height: 10,),
            FlatButton(
              color: Colors.orange.shade600,
              textColor: Colors.grey.shade200,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.orange.shade300,
              onPressed: (){
                teststr += '1';
                Navigator.pushNamed(context, '/SecondPage');
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
    );
  }
}
