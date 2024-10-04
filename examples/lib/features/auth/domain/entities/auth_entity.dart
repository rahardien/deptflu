import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;

  const AuthEntity({
    this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
