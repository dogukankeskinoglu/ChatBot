class TextFormFieldException implements Exception {
  @override
  String toString() {
    return 'Value cannot be null';
  }
}
