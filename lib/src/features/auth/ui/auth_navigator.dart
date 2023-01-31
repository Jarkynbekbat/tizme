import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:studtime/src/features/auth/ui/pages/auth_page/auth_page.dart';
import 'package:studtime/src/features/home/ui/home_navigator.dart';
import 'package:studtime/src/shared/extensions/on_widget.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(FirebaseFirestore.instance)),
      ],
      child: Navigator(
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return const AuthPage().toMatRoute();

            case '/home':
              return const HomeNavigator().toMatRoute();
            default:
              return null;
          }
        },
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          return route.settings.name == '/';
        },
      ),
    );
  }
}
