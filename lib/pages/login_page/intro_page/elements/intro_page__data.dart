import 'package:flutter/material.dart';

var pageList = [
  PageModel(
      imageUrl: "./lib/assets/intro/rasp.png",
      title: "Расписание",
      body: "Удобный просмотр расписания, приложение автоматически показывает расписание текущего дня",
      titleGradient: gradients[3]),
  PageModel(
      imageUrl: "./lib/assets/intro/dark.png",
      title: "Тип недели",
      body: "Приложение автоматически меняет цветовую тему в зависимости от типа недели(числитель,знаменатель)",
      titleGradient: gradients[2]),
  PageModel(
      imageUrl: "./lib/assets/intro/all.png",
      title: "Направление",
      body: "к аудитории,при нажатии на дисциплину можно посмотреть где проводитс занятие",
      titleGradient: gradients[4]),
  PageModel(
      imageUrl: "./lib/assets/intro/galery.png",
      title: "Галерея",
      body: "Привязка фотографий к дисциплине",
      titleGradient: gradients[5]),
  PageModel(
      imageUrl: "./lib/assets/intro/notes.png",
      title: "Заметки",
      body: "Привязка заметок к дисциплине",
      titleGradient: gradients[6]),
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
