part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class GetAccountsEvent extends AccountEvent {}

class GetAccountByIdEvent extends AccountEvent {
  final String id;

  const GetAccountByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}

class AddAccountEvent extends AccountEvent {
  final dynamic data;

  const AddAccountEvent(this.data);

  @override
  List<Object> get props => [data];
}

class RemoveAccountByIdEvent extends AccountEvent {
  final String id;

  const RemoveAccountByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}
