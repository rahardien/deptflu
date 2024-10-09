import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../cores/errors/app_failure.dart';

import 'package:freezed_annotation/freezed_annotation.dart';


part 'language_state.dart';
part 'language_cubit.freezed.dart';

class LanguageCubit extends Cubit<LanguageState> {
  
  LanguageCubit(): super(LanguageState.init());

  Future<void> getLanguages() async {}

  Future<void> getLanguageById(String id) async {}
}