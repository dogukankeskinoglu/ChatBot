import 'package:f_chatbot/core/enum/validatorEnum.dart';

class ValidatorException implements Exception {
  final ValidatorEnums validator;

  ValidatorException(this.validator);
  @override
  String toString() {
    return 'Validator not found $validator';
  }
}
