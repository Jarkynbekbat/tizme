import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/extensions/on_datetime.dart';

class WeekTypeCubit extends Cubit<WeekType> {
  WeekTypeCubit() : super(DateTime.now().getWeekType());
}
