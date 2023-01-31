import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:studtime/src/features/home/blocs/timetable_cubit/timetable_cubit.dart';
import 'package:studtime/src/shared/extensions/on_doc_ref.dart';

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
        body: TabBarView(
          children: [
            BlocBuilder<TimetableCubit, TimetableState>(
              builder: (context, state) {
                return state.map(
                  loading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (state) => ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final lesson = state.items[index];
                      return ListTile(
                        title: Text(lesson.id),
                        subtitle: lesson.timeRef
                            .getStreamBuilder<Map<String, dynamic>>(
                          mapper: (doc) => doc.data() as Map<String, dynamic>,
                          builder: (context, data) => Text(
                            '${data['from']} - ${data['to']}',
                          ),
                        ),
                      );
                    },
                  ),
                  error: (_) => const Center(child: Text('Error')),
                );
              },
            ),
            const Center(child: Text('ВТ')),
            const Center(child: Text('СР')),
            const Center(child: Text('ЧТ')),
            const Center(child: Text('ПТ')),
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
