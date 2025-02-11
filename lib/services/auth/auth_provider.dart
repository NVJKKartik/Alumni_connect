import 'package:alumni_connect/services/auth/auth_user.dart';

// 2
abstract class AuthProvide {
  Future<void> initialize();

  AuthUser? get currentUser;

  Future<AuthUser?> logIn({
    required email,
    required password,
  });

  Future<AuthUser?> createUser({
    required email,
    required password,
  });

  Future<void> logout();

  Future<void> sendEmailVerification();
}
