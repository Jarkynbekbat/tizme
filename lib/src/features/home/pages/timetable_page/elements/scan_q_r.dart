// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:studtime/src/features/home/blocs/timetable_cubit/timetable_cubit.dart';
import 'package:studtime/src/shared/data/models/classroom/classroom.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/extensions/on_context.dart';

import '../../classroom_page/classroom_page.dart';

class ScanQR extends StatelessWidget {
  const ScanQR({super.key});

  @override
  Widget build(BuildContext context) {
    final timetableCubit = context.read<TimetableCubit>();

    return IconButton(
      onPressed: () async {
        EasyLoading.show();
        final scannedName = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666",
          "Отмена",
          true,
          ScanMode.BARCODE,
        );
        EasyLoading.dismiss();

        final hasResult = scannedName.isNotEmpty && scannedName != "-1";
        if (!hasResult) {
          return EasyLoading.showError("QR-код не отсканирован");
        }

        try {
          final snap = await fs
              .collection('classroms')
              .where('name', isEqualTo: scannedName)
              .limit(1)
              .get();

          final classroom = Classroom.fromDoc(
            snap.docs.first,
          );

          await context.push(
            BlocProvider.value(
              value: timetableCubit..subscribeToClassroom(classroom),
              child: ClassroomPage(classroom: classroom),
            ),
          );
          timetableCubit.unsubscrideFromClassroom();
        } catch (e) {
          EasyLoading.showError(
            "Не удалось найти расписание для аудитории $scannedName",
          );
        }
      },
      icon: const Icon(Icons.qr_code_scanner),
    );
  }
}
