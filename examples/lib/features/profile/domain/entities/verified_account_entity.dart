



class VerifiedAccountEntity {
  final String? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const VerifiedAccountEntity({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  VerifiedAccountEntity copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      VerifiedAccountEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}

