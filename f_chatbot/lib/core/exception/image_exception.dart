import 'package:f_chatbot/core/enum/imagePath.dart';

class ImagePathException implements Exception {
  final ImagePathEnums img;

  ImagePathException(this.img);
  @override
  String toString() {
    return 'Image not found $img';
  }
}
