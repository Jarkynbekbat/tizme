import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
              Navigator.of(context).pushNamed('/about');
            },
            leading: const Icon(Icons.info_outline),
            title: const Text('О приложении'),
          ),
        ],
      ),
    );
  }
}
