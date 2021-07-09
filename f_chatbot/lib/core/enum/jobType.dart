enum JobTypeEnum {
  INTERN,
  PARTTIME,
  FULLTIME,
}

extension JobTypeEnumPath on JobTypeEnum {
  String get jobType {
    switch (this) {
      case JobTypeEnum.INTERN:
        return "staj";
      case JobTypeEnum.PARTTIME:
        return "part-time";
      case JobTypeEnum.FULLTIME:
        return "full-time";
      default:
        return "UNKNOWN ";
    }
  }
}
