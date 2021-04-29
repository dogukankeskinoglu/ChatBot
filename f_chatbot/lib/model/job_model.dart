
class JobModel {
  final String domainName;
  final String companyName;
  final String location;
  final String time;
  final String matchRate;

  JobModel(this.domainName, this.companyName, this.location, this.time,
      this.matchRate);

  @override
  String toString() {
    // TODO: implement toString
    return "DomainName:$domainName CompanyName:$companyName Location:${location} Time:$time";
  }
}
