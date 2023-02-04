import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
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

  const Schedule({
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

  factory Schedule.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Schedule(
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
