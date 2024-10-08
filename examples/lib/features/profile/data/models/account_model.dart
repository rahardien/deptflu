import '../../domain/entities/account_entity.dart';

class AccountModel extends AccountEntity {
  const AccountModel({
    super.id,
    super.name,
    super.createdAt,
    super.updatedAt,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json['id'],
        name: json['name'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
