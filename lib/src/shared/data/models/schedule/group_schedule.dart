import 'package:studtime/src/shared/data/models/classroom/classroom.dart';
import 'package:studtime/src/shared/data/models/group/group.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/data/models/subject/subject.dart';
import 'package:studtime/src/shared/data/models/teacher/teacher.dart';
import 'package:studtime/src/shared/data/models/time/time.dart';
import 'package:studtime/src/shared/extensions/on_doc_ref.dart';

class GroupSchedule extends Schedule {
  final Group group;

  GroupSchedule({
    required super.id,
    required this.group,
    required super.classroom,
    required super.subject,
    required super.teacher,
    required super.time,
    required super.targetRef,
    required super.weekday,
    required super.weekType,
    required super.lessonType,
    required super.semester,
    required super.targetType,
  });

  static Future<GroupSchedule> fromDoc(MapDocSnap doc) async {
    final data = doc.data()!;

    try {
      final classroomRef = data['classroom_ref'] as MapDocRef;
      final subjectRef = data['subject_ref'] as MapDocRef;
      final teacherRef = data['teacher_ref'] as MapDocRef;
      final timeRef = data['time_ref'] as MapDocRef;
      final targetRef = data['target_ref'] as MapDocRef;

      final results = await Future.wait([
        classroomRef.localFirstFetch(),
        subjectRef.localFirstFetch(),
        teacherRef.localFirstFetch(),
        timeRef.localFirstFetch(),
        targetRef.localFirstFetch(),
      ]);

      final classroom = Classroom.fromDoc(results[0]);
      final subject = await Subject.fromDoc(results[1]);
      final teacher = await Teacher.fromDoc(results[2]);
      final time = Time.fromDoc(results[3]);
      final group = await Group.fromDoc(results[4]);

      return GroupSchedule(
        id: doc.id,
        group: group,
        classroom: classroom,
        subject: subject,
        teacher: teacher,
        time: time,
        targetRef: targetRef,
        weekday: Weekday.values.firstWhere(
          (e) => e.name == data['weekday'],
        ),
        weekType: WeekType.values.firstWhere(
          (e) => e.name == data['week_type'],
        ),
        lessonType: LessonType.values.firstWhere(
          (e) => e.name == data['lesson_type'],
        ),
        targetType: TargetType.values.firstWhere(
          (e) => e.name == data['target_type'],
        ),
        semester: Semester.values.firstWhere(
          (e) => e.name == data['semester'],
          orElse: () => Semester.first,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }
}