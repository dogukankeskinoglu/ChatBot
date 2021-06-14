enum UnauthenticatedEnum { SUCCESSFULL, FAIL }

extension LoginEnumState on UnauthenticatedEnum {
  bool get state {
    switch (this) {
      case UnauthenticatedEnum.SUCCESSFULL:
        return true;
      case UnauthenticatedEnum.FAIL:
        return false;
      default:
        throw ("Hata Login Enum $this");
    }
  }
}
