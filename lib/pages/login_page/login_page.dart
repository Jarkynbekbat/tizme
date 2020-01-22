// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:rasp_app/helpers/refresh_data_helper.dart';
// //service
// import 'package:rasp_app/services/http/http_fio_service.dart';
// import 'package:rasp_app/services/http/http_module_service.dart';
// import 'package:rasp_app/services/local/local_cypher_service.dart';
// import 'package:rasp_app/services/local/local_fio_service.dart';
// import 'package:rasp_app/services/local/local_module_service.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final cypherController = TextEditingController();

//   void showSnackBar(message) {
//     final snackBar = SnackBar(content: Text(message));
//     _scaffoldKey.currentState.showSnackBar(snackBar);
//   }

//   final _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: Center(
//         child: Container(
//           width: 310,
//           height: 350,
//           child: Card(
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(18.0),
//             ),
//             color: Color(0xFFF4F5F9),
//             child: Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(left: 15, right: 15, top: 15),
//                   decoration: BoxDecoration(
//                     // color: Color(0xFF1C2C3B),
//                     color: Theme.of(context).appBarTheme.color == Colors.white
//                         ? Color(0xFF1C2C3B)
//                         : Theme.of(context).appBarTheme.color,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(18),
//                       topRight: Radius.circular(18),
//                     ),
//                   ),
//                   height: 130,
//                   child: Center(
//                     child: Text(
//                       'Авторизация',
//                       style: TextStyle(
//                           fontSize: 30,
//                           color: Color(0xFFF4F5F9),
//                           fontFamily: 'JosefinSans-Bold'),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 50, bottom: 15),
//                   height: 45.0,
//                   width: 240.0,
//                   child: TextField(
//                     controller: cypherController,
//                     decoration: InputDecoration(
//                       fillColor: Color(0xFFEBEBEB),
//                       filled: true,
//                       labelText: '**/*****',
//                       // errorText: _validate ? ,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(18),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   // margin: EdgeInsets.only(top: 18),
//                   child: MaterialButton(
//                     height: 45.0,
//                     minWidth: 240.0,
//                     color: Theme.of(context).appBarTheme.color == Colors.white
//                         ? Color(0xFF1C2C3B)
//                         : Theme.of(context).appBarTheme.color,
//                     textColor: Color(0xFFF4F5F9),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18.0),
//                     ),
//                     child: Text('ВОЙТИ'),
//                     onPressed: () async {
//                       try {
//                         //проверка на существование студента с таким шифром
//                         var fio =
//                             await HttpFioService.getFio(cypherController.text);

//                         if (fio.contentLength == 40) {
//                           showSnackBar('Введен неверный шифр.');
//                         } else {
//                           //если существует
//                           //fio string to fio json
//                           var temp = json.decode(utf8.decode(fio.bodyBytes));
//                           //сохраняю ФИО локально
//                           bool fioRes = await LocalFioService.setFio(
//                               temp['stud'][0]['studNm']);

//                           fioRes == true
//                               ? print(
//                                   'ФИО успешно сохранено локально:${temp['stud'][0]['studNm']}')
//                               : print('ФИО не сохранено локально');
//                           //сохраняю шифр локально
//                           bool cypherRes = await LocalCypherService.setCypher(
//                               cypherController.text);
//                           cypherRes == true
//                               ? print(
//                                   'Шифр успешно сохранен локально:${cypherController.text}')
//                               : print('Шифр не сохранен локально');
//                           //сохраняю рсписание,название группы локально
//                           bool refreshResult = await refreshDataHelper();
//                           refreshResult
//                               ? print('Расипсание сохранено локально')
//                               : print('Расипсание не сохранено локально');
//                           //сохраняю модули локально
//                           var httpModuleResponse =
//                               await HttpModuleService.getModule();
//                           LocalModuleService.setModule(
//                               utf8.decode(httpModuleResponse.bodyBytes));

//                           //переход на страницу расписаний
//                           Navigator.of(context).pushReplacementNamed('/rasp');
//                         }
//                       } catch (error) {
//                         switch (error.runtimeType.toString()) {
//                           case 'SocketException':
//                             showSnackBar(
//                                 'Для первого запуска требуется подключение к интернету.');
//                             break;
//                           case 'RangeError':
//                             showSnackBar(
//                                 'Убедитесь в правильности введенных данных.');
//                             break;
//                         }
//                       }
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
