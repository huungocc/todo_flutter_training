enum AuthType { login, register }

extension AuthTypeExtension on AuthType {
  bool get isLogin => this == AuthType.login;
  bool get isRegister => this == AuthType.register;
}