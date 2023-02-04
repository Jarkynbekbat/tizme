import 'dart:async';
import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/app.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';
import 'package:studtime/src/shared/configs/firebase_options.dart';

void main() async {
  if (kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();

    ///  Инициализация firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    /// Перехватываем ошибки в Flutter
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    /// Ограничиваем ориентацию экрана только в портретный режим
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => AppCacheRepo()),
        ],
        child: const App(),
      ),
    );
    return;
  }

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      ///  Инициализация firebase
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      /// Отключаем Crashlytics в режиме дебаг
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
        !kDebugMode,
      );

      /// Перехватываем ошибки в Flutter
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      /// Перехватываем ошибки в Isolate (вне Flutter)
      Isolate.current.addErrorListener(RawReceivePort((pair) async {
        final List<dynamic> errorAndStacktrace = pair;
        await FirebaseCrashlytics.instance.recordError(
          errorAndStacktrace.first,
          errorAndStacktrace.last,
        );
      }).sendPort);

      /// Ограничиваем ориентацию экрана только в портретный режим
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
      );

      runApp(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (_) => AppCacheRepo()),
          ],
          child: const App(),
        ),
      );
    },

    /// Перехватываем ошибки в Dart
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
  );
}
