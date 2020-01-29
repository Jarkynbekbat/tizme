import 'package:flutter/cupertino.dart';

import '../services/local/local_cypher_service.dart';
import '../services/local/local_fio_service.dart';
import '../services/local/local_group_service.dart';
import '../services/local/local_module_service.dart';
import '../services/local/local_quote_service.dart';
import '../services/local/local_rasp_service.dart';

class AuthModel extends ChangeNotifier {
  String cypher;
  String group;

  AuthModel() {
    LocalCypherService.getCypher();
    LocalGroupService.getGroup();
  }

  logIn(String cypher, context) async {
    try {
      await LocalCypherService.setCypher(cypher);
      await Navigator.of(context).pushNamed('/rasp');
    } catch (ex) {
      print(ex.toString());
    }
  }

  logOut() async {
    try {
      LocalCypherService.deleteCypher();
      LocalGroupService.deleteGroup();
      LocalFioService.deleteFio();
      LocalRaspService.deleteRasp();
      LocalModuleService.deleteModule();
      LocalQuoteService.deleteQuote();
    } catch (ex) {
      print(ex.toString());
    }
  }
}
