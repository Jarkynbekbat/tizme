import 'dart:io';

import 'package:flutter/material.dart';
//components
import 'package:new_rasp_app/components/my_app_bar.dart';
import 'package:new_rasp_app/helpers/show_snackbar.dart';
import 'package:new_rasp_app/pages/rasp_item_files_page/components/photo/photo_item.dart';
//services
import 'package:new_rasp_app/services/local/local_photo_service.dart';

class RaspItemPhotosPage extends StatefulWidget {
  static const String route = '/rasp_item_photos';
  @override
  _RaspItemNoteAddState createState() => _RaspItemNoteAddState();
}

class _RaspItemNoteAddState extends State<RaspItemPhotosPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _loading = false;
  File _image;
  List<Widget> _photos = [];
  // TODO передалать на provider подход
  // json to view
  getPhotoItems(subject) async {
    try {
      List<File> photos;
      var widgets = <Widget>[];
      photos = photos == null ? await LocalPhotoService.getPhotos(subject) : photos;
      //for photo item
      var onDelete = (photo) async {
        await LocalPhotoService.deletePhoto(photo);
        photos.removeWhere((f) => f.toString() == photo.toString());
        getPhotoItems(subject);
      };
      //json to Widget
      photos.forEach(
        (photo) => widgets.add(
          PhotoItem(photo, onDelete),
        ),
      );
      setState(() => _photos = widgets);
    } catch (ex) {
      showSnackBar('Пока нет прикрепленных фотографий...', _scaffoldKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    String _subject = ModalRoute.of(context).settings.arguments;
    getPhotoItems(_subject);
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(
        'Галерея',
        'default',
        'default',
        [
          Container(
            margin: EdgeInsets.only(
              right: 15,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                onChanged: (String value) async {
                  try {
                    setState(() => _loading = true);
                    value == 'camera'
                        ? _image = await LocalPhotoService.pickImageFromCamera()
                        : _image = await LocalPhotoService.pickImageFromGallery();

                    await LocalPhotoService.createDirectory(_subject);
                    await LocalPhotoService.savePhoto(_subject, _image);
                    setState(() => _loading = false);
                    showSnackBar('Фотография сохранена', _scaffoldKey);
                  } catch (ex) {
                    setState(() => _loading = false);
                  }
                },
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).iconTheme.color,
                ),
                items: [
                  DropdownMenuItem(
                    value: 'camera',
                    child: Text(
                      'Сделать снимок',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.body1.color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'gallery',
                    child: Text(
                      'Выбрать из галереи',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.body1.color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 6, left: 10, right: 10),
        child: _loading
            ? LinearProgressIndicator()
            : Column(
                children: _photos,
              ),
      ),
    );
  }
}
