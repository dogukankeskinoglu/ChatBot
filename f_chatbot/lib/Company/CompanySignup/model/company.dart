class Company {
  String _companyName;
  String _companyUsername;
  String _companyEmail;
  String _companyPassword;

  Company(this._companyName,this._companyUsername,this._companyEmail, this._companyPassword);

  @override
  String toString() {
    return "CompanyName:$_companyName CompanyUsername:$_companyUsername CompanyEmail:$_companyEmail Password:$_companyPassword";
  }
}
