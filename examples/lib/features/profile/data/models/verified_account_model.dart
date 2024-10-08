import '../../domain/entities/verified_account_entity.dart';




import 'package:freezed_annotation/freezed_annotation.dart';

part 'verified_account_model.freezed.dart';
part 'verified_account_model.g.dart';

@freezed
class VerifiedAccountModel with _$VerifiedAccountModel {
  const VerifiedAccountModel._();

  const factory VerifiedAccountModel({
    String? id,
    String? name,
    DateTime? createdAt, 
    DateTime? updatedAt,
  }) = _VerifiedAccountModel;

  VerifiedAccountEntity toEntity() => VerifiedAccountEntity(
    id: id,
    name: name,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory VerifiedAccountModel.fromJson(Map<String, dynamic> json) => _$VerifiedAccountModelFromJson(json);
}
