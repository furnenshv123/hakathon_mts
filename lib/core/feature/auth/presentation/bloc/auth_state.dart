part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final TokenModel model;
  AuthSuccess({required this.model});
}
class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
}