class CompanyRequest {
  String _companyName;
  String _password;

  CompanyRequest(this._companyName, this._password) {}

  @override
  String toString() {
    return "Username:$_companyName Password:$_password";
  }
}
