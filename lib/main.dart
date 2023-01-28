import 'dart:async';
import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:studtime/app.dart';
import 'package:studtime/firebase_options.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

void main() async {
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

      runApp(const App());
    },

    /// Перехватываем ошибки в Dart
    FirebaseCrashlytics.instance.recordError,
  );
}
