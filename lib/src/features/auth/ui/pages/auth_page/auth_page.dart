import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:studtime/src/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:studtime/src/shared/extensions/on_context.dart';

class AuthPage extends HookWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cypherController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthPage'),
      ),
      body: MultiBlocListener(
        listeners: [
          /// перенаправляем ,на главную страницу, если пользователь авторизован
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              state.mapOrNull(
                loggedIn: (_) => context.pushReplacementNamed('/home'),
              );
            },
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: cypherController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cypher',
                  ),
                ),
                const SizedBox(height: 16),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const CircularProgressIndicator(),
                      error: (message) => Text(
                        message,
                        style: const TextStyle(color: Colors.red),
                      ),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AuthCubit>().login(cypherController.text);
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
