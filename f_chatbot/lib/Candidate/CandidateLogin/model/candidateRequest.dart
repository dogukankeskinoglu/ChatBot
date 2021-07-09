class CandidateRequest {
  String _username;
  String _password;

  CandidateRequest(this._username, this._password);

  @override
  String toString() {
    return "Username:$_username Password:$_password";
  }
}
