



class ProfileEntity {
  final String? id;

  const ProfileEntity({
    this.id,
  });

  ProfileEntity copyWith({
    String? id,
  }) =>
      ProfileEntity(
        id: id ?? this.id,
      );
}
