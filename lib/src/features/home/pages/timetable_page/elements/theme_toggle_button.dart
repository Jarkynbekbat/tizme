import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/blocs/theme_cubit.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkModeCubit = context.watch<ThemeCubit>();
    final appCacheRepo = context.read<AppCacheRepo>();
    return IconButton(
        onPressed: () => isDarkModeCubit.toggleTheme(appCacheRepo),
        icon: Icon(isDarkModeCubit.state == ThemeMode.light
            ? Icons.light_mode
            : Icons.dark_mode));
  }
}
