import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../cores/errors/app_failure.dart';
import 'package:equatable/equatable.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountStateInit());
}
