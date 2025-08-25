class AppValidator {
  static bool validateEmail(String? input) {
    if (input == null) return false;
    RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(input);
  }

  static bool validatePassword(String? input) {
    if (input == null) return false;
    RegExp regex = RegExp(r'^[a-zA-Z0-9]{8,12}$');
    return regex.hasMatch(input);
  }

  static bool validateConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (password == null ||
        confirmPassword == null ||
        password != confirmPassword) {
      return false;
    }
    return true;
  }

  static bool validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null) return false;
    return phoneNumber.replaceAll(RegExp(r'[^0-9]'), '').length >= 10;
  }

  static bool validateCodeToVerifyPhoneNumber(String? code) {
    if (code == null) return false;
    return code.replaceAll(RegExp(r'[^0-9]'), '').isNotEmpty;
  }
}
