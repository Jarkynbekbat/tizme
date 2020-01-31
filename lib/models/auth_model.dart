import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:new_rasp_app/helpers/show_snackbar.dart';
import 'package:new_rasp_app/services/http/http_fio_service.dart';
import '../services/local/local_cypher_service.dart';
import '../services/local/local_fio_service.dart';
import '../services/local/local_group_service.dart';
import '../services/local/local_module_service.dart';
import '../services/local/local_quote_service.dart';
import '../services/local/local_rasp_service.dart';

class AuthModel extends ChangeNotifier {
  String cypher, group;

  logIn(String cypher, BuildContext context, scaffoldKey) async {
    try {
      //проверка на существование студента с таким шифром
      var fio = await HttpFioService.getFio(cypher);
      if (fio.contentLength == 40) {
        showSnackBar('Введен неверный шифр.', scaffoldKey);
      } else {
        //если существует
        //fio string to fio json
        var temp = json.decode(utf8.decode(fio.bodyBytes));
        //сохраняю ФИО,шифр локально
        await LocalFioService.setFio(temp['stud'][0]['studNm']);
        await LocalCypherService.setCypher(cypher);
        //переход на страницу расписаний
        Navigator.of(context).pushReplacementNamed('/rasp');
      }
    } catch (error) {
      switch (error.runtimeType.toString()) {
        case 'SocketException':
          showSnackBar('Для первого запуска требуется подключение к интернету.',
              scaffoldKey);
          break;
        case 'RangeError':
          showSnackBar(
              'Убедитесь в правильности введенных данных.', scaffoldKey);
          break;
      }
    }
  }

  logOut(context) async {
    try {
      LocalCypherService.deleteCypher();
      LocalGroupService.deleteGroup();
      LocalFioService.deleteFio();
      LocalRaspService.deleteRasp();
      LocalModuleService.deleteModule();
      LocalQuoteService.deleteQuote();
      Navigator.of(context).pushNamed('/login');
    } catch (ex) {
      print(ex.toString());
    }
  }
}
