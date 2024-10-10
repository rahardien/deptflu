import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../cores/errors/app_failure.dart';

import 'package:freezed_annotation/freezed_annotation.dart';


part 'account_state.dart';
part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  
  AccountCubit(): super(AccountState.init());

  Future<void> getAccounts() async {}

  Future<void> getAccountById(String id) async {}
}