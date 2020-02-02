import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final List<Widget> _items;

  MyContainer(this._items);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Theme.of(context).appBarTheme.color,
        // margin: EdgeInsets.only(left: 15, right: 15, top: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            shrinkWrap: true,
            addAutomaticKeepAlives: true,
            children: _items,
          ),
        ),
      ),
    );
  }
}
