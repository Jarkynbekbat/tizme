import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

enum BarcodeState { initial, scanning, success, failure }

class BarcodeCubit extends Cubit<BarcodeState> {
  BarcodeCubit() : super(BarcodeState.initial);
  String data='';
  Future<void> scanBarcode() async {
    emit(BarcodeState.scanning);

    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );

      if (barcode != '-1') {
        emit(BarcodeState.success);
        // Handle successful scan result
        data=barcode;
      } else {
        emit(BarcodeState.failure);
        // Handle scan failure
      }
    } catch (e) {
      emit(BarcodeState.failure);
      // Handle scan failure
    }
  }

}