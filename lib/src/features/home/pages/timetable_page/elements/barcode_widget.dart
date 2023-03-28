import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/blocs/barcode_classroom_cubit.dart';


class BarcodeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<BarcodeCubit, BarcodeState>(
        listener: (context, state) {
//           if (state == BarcodeState.success) {
// // Handle successful scan result
//           } else if (state == BarcodeState.failure) {
// // Handle scan failure
//           }
        },
        builder: (context, state) {
          if (state == BarcodeState.scanning) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ElevatedButton(
            onPressed: () {
              context.read<BarcodeCubit>().scanBarcode();

            },
            child: Text(context.read<BarcodeCubit>().data),
          );

        },
      ),
    );
  }
}