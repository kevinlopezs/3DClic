import 'package:teka_3dclic/domain/entities/model3d.dart';

class Models3DModel {
  int id;
  String name;
  String publicUrl;
  String createdAt;
  String thumbnail;

  Models3DModel({
    required this.id,
    required this.name,
    required this.publicUrl,
    required this.createdAt,
    required this.thumbnail,
  });

  factory Models3DModel.fromJson(Map<String, dynamic> json) => Models3DModel(
        id: json["id"],
        name: json["name"],
        publicUrl: json["public_url"],
        createdAt: json["created_at"],
        thumbnail: json["thumbnail"],
      );

  //Method for relation entities with map from Json
  //and used with points for better control
  Model3D toModel3D() => Model3D(
        id: id,
        name: name,
        urlLink: publicUrl,
        createdAt: createdAt,
        thumbnail: thumbnail,
      );
}
