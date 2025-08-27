enum AuthType { login, register }

extension AuthTypeExtension on AuthType {
  bool get isLogin => this == AuthType.login;
  bool get isRegister => this == AuthType.register;
}

enum AuthStatus {
  signedIn,
  signedOut,
  unknown,
}

extension AuthStatusExtension on AuthStatus {
  bool get isSignedIn => this == AuthStatus.signedIn;
  bool get isSignedOut => this == AuthStatus.signedOut;
}