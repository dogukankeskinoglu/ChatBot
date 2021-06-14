class CandidateInfo {
  String _name;
  String _surname;
  String _username;
  String _email;
  String _password;
  
  CandidateInfo(this._name,this._surname,this._username, this._email,this._password);

  @override
  String toString() {
    return "Name:$_name Surname:$_surname  Username:$_username Email:$_email Password:$_password";
  }
}
