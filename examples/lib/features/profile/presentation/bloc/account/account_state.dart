part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountStateInit extends AccountState {}

class AccountStateLoading extends AccountState {}

class AccountStateSuccess extends AccountState {
  final dynamic data;

  const AccountStateSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class AccountStateError extends AccountState {
  final AppFailure failure;
  final int? code;
  final String? message;

  const AccountStateError({required this.failure, this.code, this.message});

  @override
  List<Object> get props => [
        [
          failure,
          code,
          message,
        ],
      ];
}
