extension OnInt on int {
  String formatBytes() {
    if (this < 1024) {
      return '$this bytes';
    }

    if (this < 1024 * 1024) {
      return '${(this / 1024).toStringAsFixed(2)} KB';
    }

    if (this < 1024 * 1024 * 1024) {
      return '${(this / 1024 / 1024).toStringAsFixed(2)} MB';
    }

    return '${(this / 1024 / 1024 / 1024).toStringAsFixed(2)} GB';
  }
}
