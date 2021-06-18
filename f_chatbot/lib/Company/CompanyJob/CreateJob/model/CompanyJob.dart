class CompanyJob {
  final String companyName;
  final String department;
  final String title;
  final String description;
  final String location;
  final DateTime time;

  CompanyJob(this.companyName, this.department, this.title, this.description, this.location, this.time);

  @override
  String toString() {
    return "CompanyName:$companyName Department:$department JobTitle:$title Description:$description Location:$location Time:$time";
  }
}
