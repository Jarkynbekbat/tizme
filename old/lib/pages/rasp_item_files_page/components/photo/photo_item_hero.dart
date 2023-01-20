import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:photo_view/photo_view.dart';

class PhotoItemHero extends StatelessWidget {
  static const String route = '/photo_item_hero';
  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    // subject name
    File _image = ModalRoute.of(context).settings.arguments;
    return Hero(
      tag: 'my-hero-animation-tag-${basename(_image.path)}',
      child: PhotoView(
        enableRotation: true,
        imageProvider: FileImage(_image),
      ),
    );
  }
}
