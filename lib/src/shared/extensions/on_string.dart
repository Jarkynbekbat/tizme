extension OnString on String {
  String get toValidPath {
    String validChars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-';
    String directoryName = '';
    for (int i = 0; i < length; i++) {
      String char = this[i];
      if (validChars.contains(char)) {
        directoryName += char;
      } else {
        directoryName += '_';
      }
    }
    return directoryName;
  }
}
