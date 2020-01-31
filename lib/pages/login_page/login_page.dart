import 'package:flutter/material.dart';
import 'package:new_rasp_app/helpers/screen.dart';
import 'package:new_rasp_app/models/auth_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final cypherController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Container(
          width: Screen.width(context) * 0.8,
          height: Screen.heigth(context) * 0.55,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            color: Color(0xFFF4F5F9),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  decoration: BoxDecoration(
                    color: Color(0xFF1C2C3B),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  height: 130,
                  child: Center(
                    child: Text(
                      'Авторизация',
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFFF4F5F9),
                          fontFamily: 'JosefinSans-Bold'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 15),
                  height: 45.0,
                  width: 240.0,
                  child: TextField(
                    controller: cypherController,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFEBEBEB),
                      filled: true,
                      labelText: '**/*****',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: MaterialButton(
                    height: 45.0,
                    minWidth: 240.0,
                    color: Colors.white,
                    textColor: Color(0xFFF4F5F9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text('ВОЙТИ'),
                    onPressed: () =>
                        Provider.of<AuthModel>(context, listen: false).logIn(
                            cypherController.text, context, _scaffoldKey),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
