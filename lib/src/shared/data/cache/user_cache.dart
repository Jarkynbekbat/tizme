import 'dart:convert';

import 'package:studtime/src/shared/data/cache/app_cache.dart';
import 'package:studtime/src/shared/data/models/student/student.dart';

class UserCache extends AppCache<Student> {
  UserCache(super.prefs, super.key);

  @override
  Future<void> set(Student value) {
    final json = jsonEncode(value.toJson());
    return prefs.setString(key, json);
  }

  @override
  Student? get() {
    final json = prefs.getString(key);
    if (json == null) return null;
    return Student.fromJson(jsonDecode(json));
  }
}
