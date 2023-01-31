import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/auth/blocs/auth_cubit/auth_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: (DateTime.now().weekday - 1).clamp(0, 5),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('ПН')),
            Center(child: Text('ВТ')),
            Center(child: Text('СР')),
            Center(child: Text('ЧТ')),
            Center(child: Text('ПТ')),
          ],
        ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () => context.read<AuthCubit>().logout(),
          child: const Icon(Icons.logout),
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(text: 'ПН'),
            Tab(text: 'ВТ'),
            Tab(text: 'СР'),
            Tab(text: 'ЧТ'),
            Tab(text: 'ПТ'),
          ],
        ),
      ),
    );
  }
}
