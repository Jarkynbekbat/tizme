import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:studtime/src/features/auth/pages/auth_page/auth_page.dart';
import 'package:studtime/src/features/home/home_navigator.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';
import 'package:studtime/src/shared/extensions/on_context.dart';
import 'package:studtime/src/shared/extensions/on_widget.dart';
import 'package:studtime/src/shared/widgets/app_page_loading.dart';

class AuthNavigator extends StatefulWidget {
  const AuthNavigator({super.key});

  @override
  State<AuthNavigator> createState() => _AuthNavigatorState();
}

class _AuthNavigatorState extends State<AuthNavigator> {
  final _navKey = GlobalKey<NavigatorState>();
  late final AuthCubit _authCubit;

  @override
  void initState() {
    super.initState();

    _authCubit = AuthCubit(
      FirebaseFirestore.instance,
      context.read<AppCacheRepo>().userCache,
    );

    /// проверяем, авторизован ли пользователь
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authCubit.init();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _authCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _authCubit),
      ],
      child: MultiBlocListener(
        listeners: [
          /// перенаправляем пользователя на нужную страницу в зависимости от состояния авторизации
          BlocListener<AuthCubit, AuthState>(
            bloc: _authCubit,
            listener: (context, state) {
              state.mapOrNull(
                loggedIn: (_) {
                  _navKey.currentContext?.pushReplacementNamed('/home');
                },
                loggedOut: (_) {
                  _navKey.currentContext?.pushReplacementNamed('/auth');
                },
              );
            },
          ),
        ],
        child: Navigator(
          key: _navKey,
          initialRoute: '/',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return const AppPageLoading().toMatRoute();

              case '/auth':
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
            return true;
          },
        ),
      ),
    );
  }
}
