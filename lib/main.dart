import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/app.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Инициализация Supabase
  await Supabase.initialize(
    url: 'https://xecwlnynqnjbxxdmpqst.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhlY3dsbnlucW5qYnh4ZG1wcXN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTc3NTQxMzgsImV4cCI6MjAxMzMzMDEzOH0.SDuLO0y9JHO9vlo3boPWk-R3pARED7ejOvcAHgHjbdo',
    schema: 'public',
  );

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
}
