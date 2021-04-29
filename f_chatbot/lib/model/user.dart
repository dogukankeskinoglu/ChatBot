import 'package:f_chatbot/core/enum/userEnum.dart';

class User {
  String _username;
  String _password;
  UserEnum _type;

  User(this._username, this._password, this._type) {}

  @override
  String toString() {
    // TODO: implement toString
    return "Username:$_username Password:$_password Type:${_type.type}";
  }
}
