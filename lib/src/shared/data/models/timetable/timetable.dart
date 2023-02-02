import 'package:cloud_firestore/cloud_firestore.dart';

class Timetable {
  final String id;
  final DocumentReference classroomRef;
  final DocumentReference dayRef;
  final DocumentReference groupRef;
  final DocumentReference lessonTypeRef;
  final DocumentReference semesterRef;
  final DocumentReference subjectRef;
  final DocumentReference teacherRef;
  final DocumentReference timeRef;
  final DocumentReference weekRef;

  const Timetable({
    required this.id,
    required this.classroomRef,
    required this.dayRef,
    required this.groupRef,
    required this.lessonTypeRef,
    required this.semesterRef,
    required this.subjectRef,
    required this.teacherRef,
    required this.timeRef,
    required this.weekRef,
  });

  factory Timetable.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Timetable(
      id: doc.id,
      classroomRef: data['classroom_ref'] as DocumentReference,
      dayRef: data['day_ref'] as DocumentReference,
      groupRef: data['group_ref'] as DocumentReference,
      lessonTypeRef: data['lesson_type_ref'] as DocumentReference,
      semesterRef: data['semester_ref'] as DocumentReference,
      subjectRef: data['subject_ref'] as DocumentReference,
      teacherRef: data['teacher_ref'] as DocumentReference,
      timeRef: data['time_ref'] as DocumentReference,
      weekRef: data['week_ref'] as DocumentReference,
    );
  }
}

class ScheduleItem {
  final String id;
  final String classroom;
  final String day;
  final String group;
  final String lessonType;
  final String semester;
  final String subject;
  final String teacher;
  final String timeFrom;
  final String timeTo;
  final String week;

  const ScheduleItem({
    required this.id,
    required this.classroom,
    required this.day,
    required this.group,
    required this.lessonType,
    required this.semester,
    required this.subject,
    required this.teacher,
    required this.timeFrom,
    required this.timeTo,
    required this.week,
  });

  factory ScheduleItem.mock() {
    return const ScheduleItem(
      id: '1',
      classroom: '103',
      day: '1',
      group: 'пи-19-1',
      lessonType: 'лекция',
      semester: '1',
      subject: 'Введение в программирование на языке Python',
      teacher: 'Иванов И.И.',
      timeFrom: '13:00',
      timeTo: '14:20',
      week: '1',
    );
  }
}
