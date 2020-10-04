import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

import 'helpers/check_week_type_helper.dart';
import 'models/auth_model.dart';
import 'models/fcm_models.dart';
import 'models/module_model.dart';
import 'models/rasp_model.dart';
import 'models/session_model.dart';
import 'pages/chat_page/chat_page.dart';
import 'pages/login_page/intro_page/intro_page.dart';
import 'pages/login_page/login_page.dart';
import 'pages/navigation_drawer_pages/about_app_page.dart';
import 'pages/navigation_drawer_pages/mudule_graph_page.dart';
import 'pages/navigation_drawer_pages/notifications_page.dart';
import 'pages/navigation_drawer_pages/session_graph_page.dart';
import 'pages/rasp_item_files_page/components/note/note_item_hero.dart';
import 'pages/rasp_item_files_page/components/note/rasp_item_note_add_page.dart';
import 'pages/rasp_item_files_page/components/note/rasp_item_notes_page.dart';
import 'pages/rasp_item_files_page/components/photo/photo_item_hero.dart';
import 'pages/rasp_item_files_page/components/photo/rasp_item_photos_page.dart';
import 'pages/rasp_page/rasp_page.dart';
import 'services/local/local_cypher_service.dart';
import 'themes/dark_week_theme.dart';
import 'themes/white_week_theme.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // if (await checkConnection()) {
    //   StoreUpdater.checkUpdate();
    // }

    Widget _defaultHome =
        await LocalCypherService.getCypher() != null ? ThemeConsumer(child: RaspPage()) : ThemeConsumer(child: IntroPage());

    return runApp(ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: [
        darkWeekTheme(),
        whiteWeekTheme(),
      ],
      // checkWeekType()
      //     ? [
      //         whiteWeekTheme(),
      //         darkWeekTheme(),
      //       ]
      //     : [
      // darkWeekTheme(),
      // whiteWeekTheme(),
      //       ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RaspModel()),
          ChangeNotifierProvider(create: (_) => AuthModel()),
          ChangeNotifierProvider(create: (_) => ModuleModel()),
          ChangeNotifierProvider(create: (_) => SessionModel()),
          ChangeNotifierProvider(create: (_) => FcmModel()),
        ],
        child: MaterialApp(
          home: _defaultHome,
          routes: <String, WidgetBuilder>{
            IntroPage.route: (_) => ThemeConsumer(child: IntroPage()),
            RaspPage.route: (_) => ThemeConsumer(child: RaspPage()),
            LoginPage.route: (_) => ThemeConsumer(child: LoginPage()),
            NotificationsPage.route: (_) => ThemeConsumer(child: NotificationsPage()),
            AboutAppPage.route: (_) => ThemeConsumer(child: AboutAppPage()),
            ModuleGraphPage.route: (_) => ThemeConsumer(child: ModuleGraphPage()),
            SessionGraphPage.route: (_) => ThemeConsumer(child: SessionGraphPage()),
            RaspItemNotesPage.route: (_) => ThemeConsumer(child: RaspItemNotesPage()),
            RaspItemNoteAddPage.route: (_) => ThemeConsumer(child: RaspItemNoteAddPage()),
            NoteItemHero.route: (_) => ThemeConsumer(child: NoteItemHero()),
            RaspItemPhotosPage.route: (_) => ThemeConsumer(child: RaspItemPhotosPage()),
            PhotoItemHero.route: (_) => ThemeConsumer(child: PhotoItemHero()),
            ChatPage.route: (_) => ThemeConsumer(child: ChatPage()),
          },
        ),
      ),
    ));
  } catch (ex) {
    print(ex.toString());
  }
}
