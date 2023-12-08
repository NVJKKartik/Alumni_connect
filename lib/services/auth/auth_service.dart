import 'package:alumni_connect/services/auth/auth_provider.dart';
import 'package:alumni_connect/services/auth/auth_user.dart';
import 'package:alumni_connect/services/auth/firebase_auth_provider.dart';

// 4
class AuthService implements AuthProvide {
  final AuthProvide provider;

  const AuthService(this.provider);

  factory AuthService.firebase() => AuthService(FirebaseAuthProvide());

  @override
  Future<void> initialize() => provider.initialize();

  @override
  Future<AuthUser?> createUser({
    required email,
    required password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser?> logIn({
    required email,
    required password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logout() => provider.logout();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();
}
