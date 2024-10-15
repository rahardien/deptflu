import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String? id;

  const LoginEntity({
    this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}


