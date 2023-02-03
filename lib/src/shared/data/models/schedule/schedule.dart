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

  /// ! временно, нужно вынести логику в firebase cloud functions
  Future<({
  String classroom,
  int dayIndex,
  String group,
  String lessonType,
  String semester,
  String subject,
  String teacher,
  ({int order,String from, String to})  time,
  String week,
})> fetch() async {
    final futures = <Future<DocumentSnapshot>>[];

    futures.addAll([
     classroomRef.get(),
     dayRef.get(),
     groupRef.get(),
     lessonTypeRef.get(),
     semesterRef.get(),
     subjectRef.get(),
     teacherRef.get(),
     timeRef.get(),
     weekRef.get()
     ]);

    final results = await Future.wait(futures);

    return (
      classroom: _getValue<String>(results[0],'name', ''),
      dayIndex: _getValue<int>(results[1],'index', 0),
      group: _getValue<String>(results[2],'name', ''),
      lessonType: _getValue<String>(results[3],'name', ''),
      semester: _getValue<String>(results[4],'name', ''),
      subject: _getValue<String>(results[5],'name', ''),
      teacher: _getValue<String>(results[6],'name', ''),
      time: (
        order: _getValue<int>(results[7],'order', 0),
        from: _getValue<String>(results[7],'from', ''),
        to: _getValue<String>(results[7],'to', ''),
      ),
      week: _getValue<String>(results[8],'name', ''),
    );
  
  }
  
T _getValue<T>(DocumentSnapshot doc, String key, T defaultValue,) {
  try {
    final data = doc.data() as Map<String, dynamic>?;
    if (data == null) return defaultValue;

  final value = data[key] as T;
  return value;
} on Exception {
  return defaultValue; 
}
} 

}
