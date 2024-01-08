import 'dart:math';

import 'package:dio/dio.dart';

import '../data/models/model3d.dart';

class GetModels3D {
  final _dio = Dio();
  List<String> listavaciaImagenes = [];

  Future<Model3D> getModels3D() async {
    final response = await _dio.get(
        'https://api.thingiverse.com/popular?access_token=bbd122fac4fffdd8856584f45c63139a');

    //this is for testing API response
    //throw UnimplementedError();
    //This is a List of just API response
    List<dynamic> listica = response.data;
    //const int contador = 0;

    //This is for convert to Map the List API response
    Map<int, dynamic> mapFromList = {
      for (var id in listica) listica.indexOf(id): id
    };

    Map<String, dynamic> mapavacio = {};
    mapFromList.forEach(
      (key, value) {
        listavaciaImagenes.add(value['preview_image']);
        mapavacio['id'] = value['id'];
        mapavacio['name'] = value['name'];
        mapavacio['public_url'] = value['public_url'];
        mapavacio['created_at'] = value['created_at'];
        mapavacio['thumbnail'] = value['thumbnail'];
      },
    );

    final random = Random();
    int indiceAleatorio = random.nextInt(listavaciaImagenes.length);

    return Model3D(
      id: mapavacio['id'],
      name: mapavacio['name'],
      urlLink: mapavacio['public_url'],
      createdAt: mapavacio['created_at'],
      //urlImage: mapavacio['preview_image'],
      thumbnail: listavaciaImagenes[indiceAleatorio],
    );
  }
}
