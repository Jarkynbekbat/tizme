import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/blocs/barcode_classroom_cubit.dart';
import 'package:studtime/src/features/home/pages/scan_shedule_page.dart';


class BarcodeWidget extends StatelessWidget {
  const BarcodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final barcodeClassroomSheduleCubit =context.read<BarcodeCubit>();
    return Center(
      child: BlocConsumer<BarcodeCubit, BarcodeState>(
        listener: (context, state) {
          if (state == BarcodeState.success) {
// Handle successful scan result
            Navigator.of(context).push(
                MaterialPageRoute(builder:(context) => ScanShedulePage(classroom:'141'),
                ),
            );
          } else if (state == BarcodeState.failure) {
            Navigator.of(context).push(
              MaterialPageRoute(builder:(context) => ScanShedulePage(classroom:'141'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state == BarcodeState.scanning) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return IconButton(
            onPressed:barcodeClassroomSheduleCubit.scanBarcode,
            icon: const Icon(Icons.qr_code_scanner_rounded),
          );

        },
      ),
    );
  }
}