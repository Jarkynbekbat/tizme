import 'package:flutter/material.dart';
import 'package:studtime/src/shared/assets/assets.gen.dart';
import 'package:studtime/src/shared/extensions/on_widget.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';
import 'package:studtime/src/shared/widgets/app_drawer_menu_item.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 20,
          right: 20,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.dark_mode),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppDrawerMenuItem(
              onTap: () {},
              leading: const Icon(
                Icons.school_outlined,
                color: AppColors.primaryColor,
              ),
              title: 'График сессий',
            ).dev(),
            AppDrawerMenuItem(
              onTap: () {},
              leading: const Icon(
                Icons.school_outlined,
                color: AppColors.primaryColor,
              ),
              title: 'График модулей',
              isLast: true,
            ).dev(),
            const SizedBox(height: 40.0),
            AppDrawerMenuItem(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
                Navigator.of(context).pushNamed('/about');
              },
              leading: Assets.icLauncher.image(
                width: 32.0,
                height: 32.0,
              ),
              title: 'О приложении',
              isLast: true,
            ),
          ],
        )
      ],
    ));
  }
}
