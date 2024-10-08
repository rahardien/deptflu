import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../cores/errors/app_failure.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'verified_account_state.dart';
part 'verified_account_cubit.freezed.dart';

class VerifiedAccountCubit extends Cubit<VerifiedAccountState> {
  VerifiedAccountCubit() : super(VerifiedAccountState.init());

  Future<void> getVerifiedAccounts() async {}

  Future<void> getVerifiedAccountById(String id) async {}
}
