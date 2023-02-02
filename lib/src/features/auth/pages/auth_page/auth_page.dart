import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:studtime/src/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:studtime/src/shared/assets/assets.gen.dart';
import 'package:studtime/src/shared/extensions/on_widget.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';
import 'package:studtime/src/shared/styles/app_paddings.dart';

class AuthPage extends HookWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cypherController = useTextEditingController();
    final authCubit = context.read<AuthCubit>();

    void onLogin() async {
      EasyLoading.show();
      await authCubit.loginWithCypher(cypherController.text);
      final state = authCubit.state;

      state.maybeWhen(
        error: EasyLoading.showError,
        orElse: EasyLoading.dismiss,
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24.0),
            Flexible(child: Assets.auth.auth.svg()),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: cypherController,
                    autofocus: true,
                    onSubmitted: (_) => onLogin(),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(7),
                      MaskTextInputFormatter(
                          mask: '##/#####', filter: {"#": RegExp(r'[0-9]')}),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '12/34567',
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.33),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Хотите узнать логин?'),
                  ).dev(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onLogin,
        label: const Text('Войти'),
      ),
    );
  }
}
