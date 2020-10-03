import 'package:flutter/material.dart';

import '../helpers/screen.dart';

class MyItem extends StatelessWidget {
  final Widget _leftW;
  final Widget _rightW;
  final double _height;
  final Function _onTab;

  MyItem(this._leftW, this._rightW, this._height, this._onTab);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTab,
      child: Container(
        width: Screen.width(context) * 0.99,
        height: _height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).dividerColor,
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 0.0, // has the effect of extending the shadow
              offset: Offset(
                0, // horizontal, move right 10
                0, // vertical, move down 10
              ),
            )
          ],
        ),
        child: Card(
          color: Theme.of(context).appBarTheme.color,
          key: null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _leftW,
                _rightW,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
