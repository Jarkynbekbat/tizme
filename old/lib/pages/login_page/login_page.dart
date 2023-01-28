import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/auth_model.dart';
import '../../services/local/local_user_service.dart';
import 'Animation/FadeAnimation.dart';

class LoginPage extends StatefulWidget {
  static const String route = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _cypherController = TextEditingController();

  int _groupValue = 1;
  @override
  build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('./lib/assets/login/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: MediaQuery.of(context).size.width / 15,
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 4.2,
                      child: FadeAnimation(
                        1,
                        Container(
                          child: Image.asset('./lib/assets/login/light-1.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 2.7,
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 5.5,
                      child: FadeAnimation(
                        1.4,
                        Container(
                          child: Image.asset('./lib/assets/login/light-2.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      right: MediaQuery.of(context).size.width / 15,
                      top: MediaQuery.of(context).size.height / 25,
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 5.5,
                      child: FadeAnimation(
                        1.6,
                        Container(
                          child: Image.asset('./lib/assets/login/clock.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      right: MediaQuery.of(context).size.height / 15,
                      top: MediaQuery.of(context).size.height / 5.2,
                      height: MediaQuery.of(context).size.height / 5,
                      child: FadeAnimation(
                        1.6,
                        Container(
                          child: Image.asset('./lib/assets/norasps.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      child: FadeAnimation(
                        1.8,
                        Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.33),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Авторизация",
                                style: TextStyle(
                                  color: Theme.of(context).textTheme.body1.color,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    FadeAnimation(
                      2,
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: TextField(
                                // inputFormatters: [_maskFormatter],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff1c2c3b),
                                ),
                                controller: _cypherController,
                                cursorColor: Color(0xff1c2c3b),
                                decoration: InputDecoration(
                                  focusColor: Color(0xfffefefe),
                                  fillColor: Color(0xfffefefe),
                                  filled: true,
                                  labelText: ' *  *  /  *  *  *  *  *  * ',
                                  labelStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff1c2c3b),
                                    decorationColor: Color(0xff1c2c3b),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    ButtonBar(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                                value: 1,
                                groupValue: _groupValue,
                                activeColor: Colors.blue,
                                onChanged: (val) async {
                                  await LocalUserService.setUser('студент');
                                  setState(() => _groupValue = val);
                                }),
                            Text(
                              'СТУДЕНТ',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Radio(
                                value: 2,
                                groupValue: _groupValue,
                                activeColor: Colors.blue,
                                onChanged: (val) async {
                                  await LocalUserService.setUser('преподаватель');
                                  setState(() => _groupValue = val);
                                }),
                            Text(
                              'ПРЕПОДАВАТЕЛЬ',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 45,
                    ),
                    FadeAnimation(
                      2.2,
                      Container(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height / 16,
                          minWidth: MediaQuery.of(context).size.width,
                          color: Theme.of(context).appBarTheme.color == Colors.white
                              ? Color(0xFF1C2C3B)
                              : Theme.of(context).appBarTheme.color,
                          textColor: Color(0xFFF4F5F9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Text(
                            'ВОЙТИ',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () =>
                              Provider.of<AuthModel>(context, listen: false).logIn(_cypherController.text, context, _scaffoldKey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () async => await launch('https://stud.unitedyouth.org.kg/online/code/'),
                      child: FadeAnimation(
                        1.5,
                        Text(
                          "Не знаете шифр?",
                          style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}