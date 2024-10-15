import '../../domain/entities/main_entity.dart';


class MainModel extends MainEntity {
  const MainModel({
    super.id,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) => MainModel(
        id: json['id'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}


