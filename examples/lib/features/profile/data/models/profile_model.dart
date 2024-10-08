import '../../domain/entities/profile_entity.dart';




import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const ProfileModel._();

  const factory ProfileModel({
    String? id,
  }) = _ProfileModel;

  ProfileEntity toEntity() => ProfileEntity(
    id: id,
  );

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
}
