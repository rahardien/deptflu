import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String? id;

  const NewsEntity({
    this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
