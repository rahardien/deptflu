import 'package:equatable/equatable.dart';

class MainEntity extends Equatable {
  final String? id;

  const MainEntity({
    this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}


