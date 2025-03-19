import 'package:bloc/bloc.dart';
import 'package:hakathon_with_mts/core/feature/auth/data/models/auth_model.dart';
import 'package:hakathon_with_mts/core/feature/auth/data/models/auth_token_singleton.dart';
import 'package:hakathon_with_mts/core/feature/auth/data/models/token_model.dart';
import 'package:hakathon_with_mts/core/feature/auth/domain/auth_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {});
    on<LoginEvent>((event, emit) async {
      final TokenModel? token = await UseCaseAuth().login(model: event.model);
      if (token != null) {
        AuthTokenSingleton.instance.token = token.jwt;
        emit(AuthSuccess(model: token));
      } else {
        emit(AuthError(message: 'Неверный логин или пароль'));
      }
    });
    on<RegisterEvent>((event, emit) async {
      final TokenModel? token = await UseCaseAuth().register(
        model: event.model,
      );
      if (token != null) {
        AuthTokenSingleton.instance.token = token.jwt;
        emit(AuthSuccess(model: token));
      } else {
        emit(AuthError(message: 'Пользователь с такой почтой уже существует'));
      }
    });
  }
}
