import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String _title;
  final _icon;
  final _onTap;
  final _actions;

  MyAppBar(this._title, this._icon, this._onTap, this._actions);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: _icon == 'default' ? Icon(Icons.keyboard_backspace) : _icon,
        onPressed: _onTap == 'default' ? () => Navigator.of(context).pop() : _onTap,
      ),
      actions: _actions == 'default' ? <Widget>[] : _actions,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(23),
        ),
      ),
      title: Text('$_title'),
      centerTitle: true,
      elevation: 1.5,
    );
    // );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
