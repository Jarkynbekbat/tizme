import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:studtime/src/shared/%D1%81onstants/app_constants.dart';
import 'package:studtime/src/shared/assets/assets.gen.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';
import 'package:studtime/src/shared/styles/app_paddings.dart';
import 'package:studtime/src/shared/widgets/app_info_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('О приложении'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          AppPadding.defaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Assets.about.aboutUs.svg(
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 8.0),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 14.0,
                ),
                children: <TextSpan>[
                  const TextSpan(text: 'Наше приложение, '),
                  TextSpan(
                    text: 'Tizme',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const TextSpan(
                      text:
                          ', является неотъемлемым инструментом для студентов, чтобы всегда оставаться в курсе своего расписания. С '),
                  TextSpan(
                    text: 'Tizme',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const TextSpan(
                      text:
                          ' студенты могут легко получить доступ к своему расписанию, где бы они ни находились. Все ваши занятия, дедлайны и другие важные материалы всегда под рукой. Оставайтесь на высоте своих обязательств с '),
                  TextSpan(
                    text: 'Tizme',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Версия:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              AppConstants.appVersion,
            ),
            const SizedBox(height: AppPadding.defaultPaddingDouble),
            OpenContainer(
              closedElevation: 0.0,
              closedColor: Colors.transparent,
              closedBuilder: (context, action) {
                return TextButton.icon(
                  onPressed: action,
                  icon: const Text(
                    'Политика конфиденциальности',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  label: const Icon(Icons.open_in_new),
                );
              },
              openBuilder: (context, action) {
                return const AppInfoPage(
                  title: 'Политика конфиденциальности',
                  text: AppConstants.privacyPolicyText,
                );
              },
            ),
            OpenContainer(
              closedElevation: 0.0,
              closedColor: Colors.transparent,
              closedBuilder: (context, action) {
                return TextButton.icon(
                  onPressed: action,
                  icon: const Text(
                    'Пользовательское соглашение',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  label: const Icon(Icons.open_in_new),
                );
              },
              openBuilder: (context, action) {
                return const AppInfoPage(
                  title: 'Пользовательское соглашение',
                  text: AppConstants.userAgreementText,
                );
              },
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
