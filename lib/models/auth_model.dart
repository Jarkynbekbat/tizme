import 'package:flutter/cupertino.dart';
import 'package:new_rasp_app/helpers/my_simple_dialog.dart';
import 'package:new_rasp_app/helpers/show_snackbar.dart';
import 'package:new_rasp_app/services/http/http_fio_service.dart';
import '../services/local/local_cypher_service.dart';
import '../services/local/local_fio_service.dart';
import '../services/local/local_group_service.dart';
import '../services/local/local_module_service.dart';
import '../services/local/local_quote_service.dart';
import '../services/local/local_rasp_service.dart';
import '../services/local/local_user_service.dart';

class AuthModel extends ChangeNotifier {
  String cypher, group;

  logIn(String cypher, BuildContext context, scaffoldKey) async {
    try {
      //проверка на существование студента с таким шифром
      var fio = await HttpFioService.getFio(cypher);
      if (fio == null) {
        showSnackBar('Введен неверный шифр.', scaffoldKey);
      } else {
        //если существует
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
      bool res = await showMyDialog(
          context, 'Выход', 'Вы уверены что хотите выйти ?', 'Выйти', 'Отмена');
      if (res == true) {
        List<Future> futures = [];
        futures.add(LocalCypherService.deleteCypher());
        futures.add(LocalFioService.deleteFio());
        futures.add(LocalGroupService.deleteGroup());
        futures.add(LocalRaspService.deleteRasp());
        futures.add(LocalModuleService.deleteModule());
        futures.add(LocalQuoteService.deleteQuote());
        futures.add(LocalUserService.deleteUser());
        await Future.wait(futures);
        // возможно нужно будет добавить удаление прикрепленных фотографий и заметок
        Navigator.of(context).pushReplacementNamed('/login');
      }
    } catch (ex) {
      print(ex.toString());
    }
  }
}
