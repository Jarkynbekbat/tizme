import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

extension OnWidget on Widget {
  MaterialPageRoute toMatRoute() => MaterialPageRoute(builder: (_) => this);

  Widget dev() {
    return CupertinoButton(
      onPressed: () {
        EasyLoading.showToast(
          "Данный функционал находится в разработке",
        );
      },
      padding: EdgeInsets.zero,
      child: Opacity(
        opacity: 0.33,
        child: AbsorbPointer(child: this),
      ),
    );
  }
}
