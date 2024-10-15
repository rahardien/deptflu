import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/get_login_uc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLoginUc getLoginUc;

  LoginBloc({required this.getLoginUc}): super(LoginStateInit());
}