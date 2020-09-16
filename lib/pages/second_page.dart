import 'package:flutter/material.dart';

import 'package:dns_test/external_api/external_api.dart';
import 'widgets/custom_input_widget.dart';
import 'package:dns_test/external_api/internal/api_client.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController etGitRef = new TextEditingController();
  TextEditingController etSummary= new TextEditingController();

  int _code;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _showSnackBar(String content){
    final snackBar = new SnackBar(
      content: new Text(content),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _registerUser() async{
      ApiClient.candidateRequest.summary = etSummary.text;
      ApiClient.candidateRequest.githubProfileUrl = etGitRef.text;

      var finalResponse = await DataFetcher.sendRequest(ApiClient.apiToken, ApiClient.candidateRequest);
      _code = finalResponse.code;
      print('Final registration with token');
      print(finalResponse.toJson());

      if (_code != 0 ) {
        _showSnackBar("Данные введены неверно");
      } else {
        _showSnackBar("Поздравляем! Регистрация завершена");
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
                      hintText: 'Ссылка на GitHub',
                      textEditingController: etGitRef,
                    ),
                    CustomInputField(
                      hintText: 'Ссылка на резюме',
                      textEditingController: etSummary,
                    ),
                    FlatButton(
                      color: Colors.orange.shade600,
                      textColor: Colors.grey.shade200,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.orange.shade300,
                      onPressed: (){
                        _registerUser();
                      },
                      child: Text(
                        "Завершить регистрацию",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )
                  ]
              ),
            ),
          )
      ),
    );
  }
}

