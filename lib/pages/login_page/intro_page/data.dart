import 'package:flutter/material.dart';

var pageList = [
  PageModel(
      imageUrl: "./lib/assets/intro/weekend.png",
      title: "Выходные",
      body:
          "Каждые выходные вы можете увидеть цитаты об отдыхе, так же иожно обновить страницу и посмотреть новые цитаты",
      titleGradient: gradients[0]),
  PageModel(
      imageUrl: "./lib/assets/intro/menu.png",
      title: "Меню",
      body:
          "Навигационное меню, просмотр личных данных пользователя, удобная навигация по страницам приложения",
      titleGradient: gradients[1]),
  PageModel(
      imageUrl: "./lib/assets/intro/dark.png",
      title: "Темный",
      body:
          "Пользователь может легко перейти с основного режима в темный режим и обратно в основной.",
      titleGradient: gradients[2]),
  PageModel(
      imageUrl: "./lib/assets/intro/rasp.png",
      title: "Расписание",
      body:
          "Удобный просмотр расписания, приложение автоматически показывает расписание текущего дня, также есть возможность просмотра по другим дням недели.",
      titleGradient: gradients[3]),
  PageModel(
      imageUrl: "./lib/assets/intro/all.png",
      title: "Доп. Меню",
      body:
          "При нажатии на любую дисциплину, вы увидете новые функции и можете легко воспользоваться ими.",
      titleGradient: gradients[4]),
  PageModel(
      imageUrl: "./lib/assets/intro/galery.png",
      title: "Галерея",
      body:
          "Привязка фото к дисциплине, можно сфотографировать самому либо можете выбрать из галереи",
      titleGradient: gradients[5]),
  PageModel(
      imageUrl: "./lib/assets/intro/notes.png",
      title: "Заметки",
      body:
          "Редактирование заметок, пользователь может создать заметку также удалить и изменить выбрав любой предмет",
      titleGradient: gradients[6]),
  PageModel(
      imageUrl: "./lib/assets/intro/audit.png",
      title: "Аудитория",
      body:
          "Схема кабинета, при нажатии на предмет появляется доп. меню и путь к аудитории где проводиться выбранное занятие",
      titleGradient: gradients[7]),
];

List<List<Color>> gradients = [
  [Color(0xFF9708CC), Color(0xFF43CBFF)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)],
  [Color(0xFF9708CC), Color(0xFF43CBFF)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF9708CC), Color(0xFF736EFE)],
  [Color(0xFF5EFCE8), Color(0xFF43CBFF)],
];

class PageModel {
  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient = [];
  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}
