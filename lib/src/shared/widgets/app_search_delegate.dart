import 'package:flutter/material.dart';
import 'package:studtime/src/shared/data/models/abstracts/suggestion_item.dart';
import 'package:studtime/src/shared/data/models/group/group.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';

class AppSearchDelegate extends SearchDelegate<SuggestionItem?> {
  final List<SuggestionItem> items;

  AppSearchDelegate(this.items)
      : super(
          searchFieldLabel: "Поиск",
          searchFieldStyle: TextStyle(
            color: AppColors.secondaryColor.withOpacity(0.66),
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
            color: AppColors.primaryColor,
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
            item is Group ? Icons.group : Icons.person,
            color: AppColors.primaryColor,
          ),
          title: Text(item.name),
        );
      },
    );
  }
}
