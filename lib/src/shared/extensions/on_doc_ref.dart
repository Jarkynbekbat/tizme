import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

extension OnDocRef on DocumentReference {
  Widget getStreamBuilder<T>({
    required Widget Function(BuildContext, T) builder,
    required T Function(DocumentSnapshot) mapper,
    Widget Function(BuildContext, Object)? errorBuilder,
    Widget Function(BuildContext)? loadingBuilder,
    Widget Function(BuildContext)? emptyBuilder,
  }) {
    return StreamBuilder<DocumentSnapshot>(
      stream: snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return errorBuilder?.call(context, snapshot.error!) ??
              const Center(child: Text('Error'));
        }

        if (snapshot.hasData) {
          final data = snapshot.data!;
          if (data.exists) {
            return builder(context, mapper(data));
          } else {
            return emptyBuilder?.call(context) ??
                const Center(child: Text('Empty'));
          }
        } else {
          return loadingBuilder?.call(context) ??
              const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
