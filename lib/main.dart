import 'package:flutter/material.dart';
import 'package:new_rasp_app/models/rasp_item_model.dart';
import 'package:new_rasp_app/pages/rasp_page/rasp_page.dart';
import 'package:new_rasp_app/themes/dark_week_theme.dart';
import 'package:new_rasp_app/themes/white_week_theme.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'pages/login_page/intro_page/intro_page.dart';
import 'services/local/local_cypher_service.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    Widget _defaultHome = IntroPage();
    //при авторизации
    await LocalCypherService.setCypher('16/3000');
    bool _isAuthorized = await LocalCypherService.getCypher() != null;
    print(_isAuthorized);

    return runApp(ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: [
        darkWeekTheme(),
        whiteWeekTheme(),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RaspItemsModel()),
        ],
        child: MaterialApp(
          home: _defaultHome,
          routes: <String, WidgetBuilder>{
            //создаю роуты приложения
            '/intro': (BuildContext context) =>
                ThemeConsumer(child: IntroPage()),
            '/rasp': (BuildContext context) => ThemeConsumer(child: RaspPage()),
            // '/login': (BuildContext context) =>
            //     ThemeConsumer(child: LoginPage()),
            // '/about_app': (BuildContext context) =>
            //     ThemeConsumer(child: AboutAppPage()),
            // '/module_graph': (BuildContext context) =>
            //     ThemeConsumer(child: ModuleGraphPage()),
            // '/session_graph': (BuildContext context) =>
            //     ThemeConsumer(child: SessionGraphPage()),
            // //просмотр заметок выбранного предмета
            // '/rasp_item_notes': (BuildContext context) =>
            //     ThemeConsumer(child: RaspItemNotesPage()),
            // //добавление заметки для выбранного предмета
            // '/rasp_item_note_add': (BuildContext context) =>
            //     ThemeConsumer(child: RaspItemNoteAddPage()),
            // //прочитать заметку детально
            // '/note_item_hero': (BuildContext context) =>
            //     ThemeConsumer(child: NoteItemHero()),
            // //просмотр фотографий выбранного предмета
            // '/rasp_item_photos': (BuildContext context) =>
            //     ThemeConsumer(child: RaspItemPhotosPage()),
            // //посмотреть выбранную фотографию
            // '/photo_item_hero': (BuildContext context) =>
            //     ThemeConsumer(child: PhotoItemHero()),
          },
        ),
      ),
    ));
  } catch (ex) {
    print(ex.toString());
  }
}
