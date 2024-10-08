import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const AccountEntity({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        createdAt,
        updatedAt,
      ];
}
