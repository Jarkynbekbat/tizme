import 'package:flutter/material.dart';

class AppFutureWidget<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(BuildContext, T) builder;
  final Widget Function(BuildContext)? loadingBuilder;
  final Widget Function(BuildContext, Object)? errorBuilder;

  const AppFutureWidget({
    Key? key,
    required this.future,
    required this.builder,
    this.loadingBuilder,
    this.errorBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return errorBuilder?.call(context, snapshot.error!) ??
              const Center(child: Text('Error'));
        }

        if (snapshot.hasData) {
          return builder(context, snapshot.data as T);
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: loadingBuilder?.call(context) ??
                const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
          );
        }
      },
    );
  }
}
