part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}



class RegisterEvent extends AuthEvent {
  final AuthModel model;

  RegisterEvent({required this.model});
}
class LoginEvent extends AuthEvent {
  final AuthModel model;

  LoginEvent({required this.model});
}