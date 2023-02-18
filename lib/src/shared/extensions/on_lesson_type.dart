import 'package:studtime/src/shared/data/models/schedule/schedule.dart';

extension OnLessonType on LessonType {
  String get title {
    switch (this) {
      case LessonType.lecture:
        return 'Лекция';
      case LessonType.practice:
        return 'Практика';
      case LessonType.lab:
        return 'Лабораторная';
      case LessonType.exam:
        return 'Экзамен';
    }
  }
}
