import '../data/models/teacher/teacher.dart';

extension GradeRuTitle on Grade {
  String get ruTitle {
    switch (this) {
      case Grade.professor:
        return 'Проф.';
      case Grade.docent:
        return 'Доцент';
      case Grade.teacher:
        return 'Преп.';
      case Grade.srteacher:
        return 'Ст.Преп.';
    }
  }
}
