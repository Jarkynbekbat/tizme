import '../data/models/schedule/schedule.dart';

extension OnTimeSlot on TimeSlot {
  String get ruTitle {
    final trMap = {
      TimeSlot.slot1: '08:00\n09:20',
      TimeSlot.slot2: '09:35\n10:50',
      TimeSlot.slot3: '11:05\n12:25',
      TimeSlot.slot4: '13:00\n14:20',
      TimeSlot.slot5: '14:30\n15:50',
      TimeSlot.slot6: '16:00\n17:20',
      TimeSlot.slot7: '17:30\n18:50',
    };
    return trMap[this]!;
  }
}
