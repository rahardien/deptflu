part of 'login_bloc.dart';

{{#using_equatable}}
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginWithEmailAndPasswordEvent extends LoginEvent {}
{{/using_equatable}}

{{#using_freezed}}
@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginWithEmailAndPassword() = _LoginWithEmailAndPasswordEvent;
}
{{/using_freezed}}
