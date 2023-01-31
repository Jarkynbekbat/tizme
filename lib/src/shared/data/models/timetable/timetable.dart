// classroom_ref : /classrooms/raZxQQEDChRhZmg7L0il
// day_ref: /days/hFmLhmGpFaTZl6VRGIZf
// group_ref: /groups/FiZbzHxEr2dQgmLKK4Dd
// lesson_type_ref: /lesson_types/CNu2i90yv8kdsogXgp5P
// semester_ref: /semesters/3O6Nfz5qF5rMNbPdtmyv
// subject_ref: /subjects/jmPryMCImN1XqwMgUBcY
// teacher_ref: /teachers/wrT41SHBb8wqPDwvutKS
// time_ref: /times/55G2r6yV8r5FTLqw4pIJ
// week_ref: /weeks/Ihcsi7iIUCTdA6Lc6sKt

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

  factory Timetable.fromDocument(DocumentSnapshot doc) {
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
