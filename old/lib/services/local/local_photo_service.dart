import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class LocalPhotoService {
  static Future<Directory> createDirectory(String subject) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    return Directory('$appDocPath/$subject').create(recursive: true);
  }

  static Future<File> pickImageFromCamera() async {
    return await ImagePicker.pickImage(source: ImageSource.camera);
  }

  static Future<File> pickImageFromGallery() async {
    return await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  static Future<File> savePhoto(String subject, File file) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    return await file.copy('$appDocPath/$subject/${DateTime.now().toUtc().toLocal()}.jpg');
    // '$appDocPath/$subject/${DateTime.now().toUtc().toIso8601String()}.jpg');
  }

  static void seeFolderOfSubject(String subject) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    Directory subjectDir = Directory(join(appDocPath, subject));
    List contents = subjectDir.listSync();
    print('files of $subject');

    // print files and directories
    for (var fileOrDir in contents) {
      if (fileOrDir is File) {
        print('file :' + basename(fileOrDir.path));
      } else if (fileOrDir is Directory) {
        print('directory :' + fileOrDir.path);
      }
    }
  }

  static getPhotos(String subject) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    // to subject dir
    Directory subjectDir = Directory(join(appDocPath, subject));

    // get files from dir
    List contents = subjectDir.listSync();
    //push files to array
    List<File> photos = [];
    for (var fileOrDir in contents) {
      if (fileOrDir is File) photos.insert(0, fileOrDir);
    }
    // files of subject
    return photos;
  }

  static deletePhoto(File photo) async {
    await photo.delete();
  }
}
