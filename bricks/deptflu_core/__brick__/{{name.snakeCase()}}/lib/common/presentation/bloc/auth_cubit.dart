import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{name.snakeCase()}}/common/domain/entities/user_session_entity.dart';
import 'package:{{name.snakeCase()}}/common/domain/repositories/auth_repository.dart';
import 'package:{{name.snakeCase()}}/common/presentation/bloc/auth_state.dart';
import 'package:{{name.snakeCase()}}/cores/constants/auth_constants.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(const AuthState());

  final AuthRepository authRepository;

  Future<void> authenticate({
    String? userId,
    String? accessToken,
  }) async {
    try {
      final session = UserSessionEntity(
        userId: userId,
        accessToken: accessToken,
      );
      final result = await authRepository.saveSesssion(session);

      result.fold(
        (e) {
          emit(state.copyWith(
            status: AuthStatus.error,
            accessToken: null,
            message: e.toString(),
          ));
        },
        (_) {
          emit(state.copyWith(
            status: AuthStatus.authenticated,
            accessToken: accessToken,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        accessToken: null,
        message: e.toString(),
      ));
    }
  }

  Future<void> signOut() async {
    try {
      final result = await authRepository.destroySession();

      result.fold(
        (e) {
          emit(state.copyWith(
            status: AuthStatus.error,
            accessToken: null,
            message: e.toString(),
          ));
        },
        (_) {
          emit(state.copyWith(
            status: AuthStatus.unauthenticated,
            accessToken: null,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        accessToken: null,
        message: e.toString(),
      ));
    }
  }
}
