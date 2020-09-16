import 'package:dns_test/external_api/internal/api_client.dart';
import 'package:flutter/material.dart';

import 'package:dns_test/external_api/external_api.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController etGitRef = new TextEditingController();
  TextEditingController etSummary= new TextEditingController();


  void _registerUser() async{
      ApiClient.candidateRequest.summary = etSummary.text;
      ApiClient.candidateRequest.githubProfileUrl = etGitRef.text;

      var finalResponse = await DataFetcher.sendRequest(ApiClient.apiToken, ApiClient.candidateRequest);
      print('Final registration with token');
      print(finalResponse.toJson());
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
                Card(
                    margin: EdgeInsets.fromLTRB(25,32, 25, 0),
                    elevation: 2,
                    child: SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: TextField(
                          controller: etGitRef,
                          decoration: new InputDecoration(
                            hintText: 'Ссылка на GitHub',
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
                    margin: EdgeInsets.fromLTRB(25,32, 25, 0),
                    elevation: 2,
                    child: SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                        child: TextField(
                          controller: etSummary,
                          decoration: new InputDecoration(
                            hintText: 'Ссылка на резюме',
                          ),
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),
                    )
                ),
                FlatButton(
                  color: Colors.orange.shade600,
                  textColor: Colors.grey.shade200,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.orange.shade300,
                  onPressed: (){
                    Navigator.pushNamed(context, '/SecondPage');
                    _registerUser();
                  },
                  child: Text(
                    "Получить ключ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              ]
          )
      ),
    );
  }
}

