// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:studtime/src/features/home/blocs/timetable_cubit/timetable_cubit.dart';
import 'package:studtime/src/features/home/pages/classroom_schedule_page/classroom_schedule_page.dart';
import 'package:studtime/src/shared/extensions/on_context.dart';

import '../../../../../shared/data/models/schedule/schedule.dart';

class ScanQR extends StatelessWidget {
  const ScanQR({super.key});

  @override
  Widget build(BuildContext context) {
    final timetableCubit = context.read<TimetableCubit>();

    return BlocBuilder<TimetableCubit, TimetableState>(
      builder: (context, state) {
        List<Schedule> items = [];

        bool ignoring = true;
        double opacity = 0.3;

        state.mapOrNull(
          loaded: (loaded) {
            items = loaded.items;
            ignoring = false;
            opacity = 1.0;
          },
        );

        return IgnorePointer(
          ignoring: ignoring,
          child: AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              onPressed: () async {
                EasyLoading.show();
                final scanResult = await FlutterBarcodeScanner.scanBarcode(
                  "#ff6666",
                  "Отмена",
                  true,
                  ScanMode.BARCODE,
                );
                EasyLoading.dismiss();

                final hasResult = scanResult.isNotEmpty && scanResult != "-1";
                if (!hasResult) {
                  EasyLoading.showError("QR-код не отсканирован");
                }

                try {
                  final classroom = items
                      .map((schedule) => schedule.classroom)
                      .firstWhere((classroom) => classroom.name == scanResult);

                  context.push(
                    BlocProvider.value(
                      value: timetableCubit,
                      child: ClassroomSchedulePage(classroom: classroom),
                    ),
                  );
                } catch (e) {
                  EasyLoading.showError("Не удалось найти аудиторию");
                }
              },
              icon: const Icon(Icons.qr_code_scanner),
            ),
          ),
        );
      },
    );
  }
}
