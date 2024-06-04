class PasswordValidate {
  bool hasMinLength(String password, {int minLength = 8}) {
    return password.length >= minLength ? true : false;
  }

  bool hasMinNormalChar(String password, {int normalCount = 0}) {
    String pattern = '^(.*?[A-Z]){' + normalCount.toString() + ',}';

    return password.toUpperCase().contains(RegExp(pattern));
  }

  bool hasMinUppercase(String password, {int uppercaseCount = 0}) {
    String pattern = '^(.*?[A-Z]){' + uppercaseCount.toString() + ',}';

    return password.contains(RegExp(pattern));
  }

  bool hasMinLowercase(String password, {int lowercaseCount = 0}) {
    String pattern = '^(.*?[a-z]){' + lowercaseCount.toString() + ',}';

    return password.contains(RegExp(pattern));
  }

  bool hasMinNumericChar(String password, {int numericCount = 0}) {
    String pattern = '^(.*?[0-9]){' + numericCount.toString() + ',}';

    return password.contains(RegExp(pattern));
  }

  bool hasMinSpecialChar(String password, {int specialCount = 0}) {
    String pattern =
        r"^(.*?[$&+,\:;/=?@#|'<>.^*()_%!-]){" + specialCount.toString() + ",}";

    return password.contains(RegExp(pattern));
  }

  bool ruleDefault(String password, {int minLenght = 8}) {
    final result = hasMinLength(password, minLength: minLenght) &&
        hasMinLowercase(password, lowercaseCount: 1) &&
        hasMinNumericChar(password, numericCount: 1) &&
        hasMinSpecialChar(password, specialCount: 1) &&
        hasMinUppercase(password, uppercaseCount: 1);

    return result;
  }
}
