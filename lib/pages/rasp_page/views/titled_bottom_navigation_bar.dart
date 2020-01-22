import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class RaspTitledBottomNavigationBar extends StatelessWidget {
  final int _selectedDay;
  final Function _jumpTo;
  RaspTitledBottomNavigationBar(this._selectedDay, this._jumpTo);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).dividerColor,
            blurRadius: 10, // has the effect of softening the shadow
            spreadRadius: 0.0, // has the effect of extending the shadow
            offset: Offset(
              1, // horizontal, move right 10
              1, // vertical, move down 10
            ),
          )
        ],
      ),
      child: Card(
          color: Theme.of(context).appBarTheme.color,
          margin: EdgeInsets.only(bottom: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23.0),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(23),
                topLeft: Radius.circular(23),
              ),
              child: TitledBottomNavigationBar(
                  activeColor: Theme.of(context).iconTheme.color,
                  currentIndex:
                      _selectedDay, // Use this to update the Bar giving a position
                  onTap: (index) => _jumpTo(index),
                  items: [
                    TitledNavigationBarItem(
                        title: 'ПН',
                        icon: Icons.looks_one,
                        backgroundColor: Theme.of(context).appBarTheme.color),
                    TitledNavigationBarItem(
                        title: 'ВТ',
                        icon: Icons.looks_two,
                        backgroundColor: Theme.of(context).appBarTheme.color),
                    TitledNavigationBarItem(
                        title: 'СР',
                        icon: Icons.looks_3,
                        backgroundColor: Theme.of(context).appBarTheme.color),
                    TitledNavigationBarItem(
                        title: 'ЧТ',
                        icon: Icons.looks_4,
                        backgroundColor: Theme.of(context).appBarTheme.color),
                    TitledNavigationBarItem(
                        title: 'Пт',
                        icon: Icons.looks_5,
                        backgroundColor: Theme.of(context).appBarTheme.color),
                  ]))),
    );
  }
}
