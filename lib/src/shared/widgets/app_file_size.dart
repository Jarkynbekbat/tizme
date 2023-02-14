import 'dart:io';

import 'package:flutter/material.dart';

class AppFileSize extends StatefulWidget {
  final String path;

  const AppFileSize(this.path, {super.key});

  @override
  State<AppFileSize> createState() => _AppFileSize();
}

class _AppFileSize extends State<AppFileSize>
    with SingleTickerProviderStateMixin {
  double _fileSizeInKb = 0.0;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _getFilesizeInKb();
  }

  Future<void> _getFilesizeInKb() async {
    final file = File(widget.path);
    int fileSizeInBytes = await file.length();
    setState(() {
      _fileSizeInKb = fileSizeInBytes / 1024;
      _isVisible = true;
    });
  }

  String _formatFileSize(double fileSizeInKb) {
    if (fileSizeInKb >= 1024 * 1024) {
      return '${(fileSizeInKb / (1024 * 1024)).toStringAsFixed(2)} GB';
    } else if (fileSizeInKb >= 1024) {
      return '${(fileSizeInKb / 1024).toStringAsFixed(2)} MB';
    } else {
      return '${fileSizeInKb.toStringAsFixed(2)} KB';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Text(
        _formatFileSize(_fileSizeInKb),
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
