import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_page_text_data_cubit.dart';

class HomePage extends StatelessWidget {

  HomePageTextDataCubit homePageTextDataCubit;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  _showSnackBar() {
    final snackBar = new SnackBar(
      content: new Text("Данные введены неверно"),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    homePageTextDataCubit = BlocProvider.of<HomePageTextDataCubit>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: BlocBuilder<HomePageTextDataCubit, HomePageTextDataState>(
            builder: (context, state) {
              if(state is HomePageTextDataInitial) {
                return buildInitialChildScrollView();
              }
              if(state is HomePageLoading) {
                return buildCenterLoading();
              }
              if(state is HomePageError) {
                Future.delayed(Duration.zero, (){_showSnackBar();});
                return buildInitialChildScrollView();
              }
              if(state is HomePageSuccess) {
                Future.delayed(Duration.zero, (){Navigator.pushNamed(context, '/SecondPage');});
                homePageTextDataCubit.emit(HomePageTextDataInitial());
                return buildCenterLoading();
              }
              return buildCenterLoading();
            },
          ),
        ),
      ),
    );
  }

  Center buildCenterLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  SingleChildScrollView buildInitialChildScrollView() {
    return SingleChildScrollView(
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
                      onChanged: (value) => homePageTextDataCubit.lastNameChanged(value),
                      decoration: new InputDecoration(
                        hintText: "Фамилия",
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
                      onChanged: (value) => homePageTextDataCubit.firstNameChanged(value),
                      decoration: new InputDecoration(
                        hintText: "Имя",
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
                      onChanged: (value) => homePageTextDataCubit.patronymicChanged(value),
                      decoration: new InputDecoration(
                        hintText: "Отчество",
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
                      onChanged: (value) => homePageTextDataCubit.emailChanged(value),
                      decoration: new InputDecoration(
                        hintText: "E-mail",
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
                      onChanged: (value) => homePageTextDataCubit.phoneChanged(value),
                      decoration: new InputDecoration(
                        hintText: "Телефон",
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
                  onPressed: () {
                    homePageTextDataCubit.requestData();
                  },
                  child: Text(
                    "Получить ключ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          );
  }
}