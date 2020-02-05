import 'package:flutter/material.dart';
import 'package:new_rasp_app/models/auth_model.dart';
import 'package:new_rasp_app/models/module_model.dart';
import 'package:new_rasp_app/models/rasp_model.dart';
import 'package:new_rasp_app/models/session_model.dart';
import 'package:new_rasp_app/pages/login_page/login_page.dart';
import 'package:new_rasp_app/pages/navigation_drawer_pages/about_app_page.dart';
import 'package:new_rasp_app/pages/navigation_drawer_pages/mudule_graph_page.dart';
import 'package:new_rasp_app/pages/navigation_drawer_pages/notifications_page.dart';
import 'package:new_rasp_app/pages/navigation_drawer_pages/session_graph_page.dart';
import 'package:new_rasp_app/pages/rasp_item_files_page/components/note/note_item_hero.dart';
import 'package:new_rasp_app/pages/rasp_item_files_page/components/note/rasp_item_note_add_page.dart';
import 'package:new_rasp_app/pages/rasp_item_files_page/components/note/rasp_item_notes_page.dart';
import 'package:new_rasp_app/pages/rasp_item_files_page/components/photo/photo_item_hero.dart';
import 'package:new_rasp_app/pages/rasp_item_files_page/components/photo/rasp_item_photos_page.dart';
import 'package:new_rasp_app/pages/rasp_page/rasp_page.dart';
import 'package:new_rasp_app/services/local/local_cypher_service.dart';
import 'package:new_rasp_app/themes/dark_week_theme.dart';
import 'package:new_rasp_app/themes/white_week_theme.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'helpers/check_week_type_helper.dart';
import 'pages/login_page/intro_page/intro_page.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    Widget _defaultHome = await LocalCypherService.getCypher() != null
        ? ThemeConsumer(child: RaspPage())
        : ThemeConsumer(child: IntroPage());

    //TODO: протестить - автоматическая смена цветовой темы в зависимости он типа недели
    return runApp(ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: checkWeekType()
          ? [whiteWeekTheme(), darkWeekTheme()]
          : [darkWeekTheme(), whiteWeekTheme()],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RaspModel()),
          ChangeNotifierProvider(create: (_) => AuthModel()),
          ChangeNotifierProvider(create: (_) => ModuleModel()),
          ChangeNotifierProvider(create: (_) => SessionModel()),
        ],
        child: MaterialApp(
          home: _defaultHome,
          routes: <String, WidgetBuilder>{
            //создаю роуты приложения
            '/intro': (BuildContext context) =>
                ThemeConsumer(child: IntroPage()),
            '/rasp': (BuildContext context) => ThemeConsumer(child: RaspPage()),
            '/login': (BuildContext context) =>
                ThemeConsumer(child: LoginPage()),
            '/notifications': (BuildContext context) =>
                ThemeConsumer(child: NotificationsPage()),
            '/about_app': (BuildContext context) =>
                ThemeConsumer(child: AboutAppPage()),
            '/module_graph': (BuildContext context) =>
                ThemeConsumer(child: ModuleGraphPage()),
            '/session_graph': (BuildContext context) =>
                ThemeConsumer(child: SessionGraphPage()),
            //просмотр заметок выбранного предмета
            '/rasp_item_notes': (BuildContext context) =>
                ThemeConsumer(child: RaspItemNotesPage()),
            //добавление заметки для выбранного предмета
            '/rasp_item_note_add': (BuildContext context) =>
                ThemeConsumer(child: RaspItemNoteAddPage()),
            //прочитать заметку детально
            '/note_item_hero': (BuildContext context) =>
                ThemeConsumer(child: NoteItemHero()),
            //просмотр фотографий выбранного предмета
            '/rasp_item_photos': (BuildContext context) =>
                ThemeConsumer(child: RaspItemPhotosPage()),
            //посмотреть выбранную фотографию
            '/photo_item_hero': (BuildContext context) =>
                ThemeConsumer(child: PhotoItemHero()),
          },
        ),
      ),
    ));
  } catch (ex) {
    print(ex.toString());
  }
}
