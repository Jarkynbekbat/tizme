import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studtime/src/shared/widgets/app_error_text.dart';

extension OnDocRef on DocumentReference<Map<String, dynamic>> {
  Future<DocumentSnapshot<Map<String, dynamic>>> localFirstFetch() async {
    try {
      final snapshot = await get(const GetOptions(source: Source.cache));
      if (snapshot.exists) {
        return snapshot;
      }
    } catch (e) {
      return get();
    }
    return get();
  }

  Widget mapToWidget<T>({
    required T Function(Map<String, dynamic>) mapper,
    required Widget Function(T) builder,
    Widget? loading,
    Widget Function(String?)? error,
  }) {
    return FutureBuilder(
      future: localFirstFetch(),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Builder(
            key: ValueKey(snapshot.connectionState),
            builder: (context) {
              if (snapshot.hasError) {
                final message = snapshot.error.toString();
                return error?.call(message) ?? AppErrorText(message: message);
              }

              if (snapshot.hasData) {
                final data = snapshot.data as DocumentSnapshot;

                if (!data.exists) {
                  return const SizedBox.square(dimension: 2.0);
                }

                final map = data.data() as Map<String, dynamic>;

                final model = mapper(map);
                return builder(model);
              }

              return loading ?? const SizedBox.square(dimension: 2.0);
            },
          ),
        );
      },
    );
  }
}
