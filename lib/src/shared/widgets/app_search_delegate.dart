import 'package:flutter/material.dart';
import 'package:studtime/src/shared/data/models/suggestion_item.dart';
import 'package:studtime/src/shared/data/models/group/group.dart';

class AppSearchDelegate extends SearchDelegate<SuggestionItem?> {
  final List<SuggestionItem> items;
  final BuildContext context;

  AppSearchDelegate(this.items, this.context)
      : super(
          searchFieldLabel: "Поиск",
          searchFieldStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        );

  String get _query => query.toLowerCase();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = items.where((el) {
      final name = el.name.toLowerCase();

      return name.startsWith(_query) ||
          (_query.length > 1 && name.contains(_query));
    });

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results.elementAt(index);
        return ListTile(
          onTap: () => close(context, item),
          leading: Icon(
            item is Group ? Icons.group : Icons.person,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(item.name),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = items.where(
      (el) {
        final name = el.name.toLowerCase();

        return name.startsWith(_query) ||
            (_query.length > 1 && name.contains(_query));
      },
    );

    if (results.isEmpty) {}

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results.elementAt(index);
        return ListTile(
          onTap: () => close(context, item),
          leading: Icon(
            item is Group ? Icons.groups_rounded : Icons.person,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(
            item.name,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      },
    );
  }
}
