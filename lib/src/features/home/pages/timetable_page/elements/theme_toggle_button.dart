import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/blocs/theme_cubit.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkModeCubit = context.watch<ThemeCubit>();
    return IconButton(
        onPressed: isDarkModeCubit.toggleTheme,
        icon: Icon(isDarkModeCubit.state == ThemeMode.light
            ? Icons.light_mode
            : Icons.dark_mode));
  }
}
