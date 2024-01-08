import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teka_3dclic/services/get_3dmodels.dart';

import '../../data/models/model3d.dart';

class Clic3DProvider extends ChangeNotifier {
  //Constructor
  Clic3DProvider();

  //This is an instance from dio http request to get model
  final GetModels3D getModels3D = GetModels3D();
  List<String> miListicaLlenita = [];

  //Here create a list of messages to show in ListView chat
  List<Model3D> models3D = [
    /*Model3D(
        id: 1234,
        name: 'name',
        urlLink: 'urlLink',
        createdAt: 'created_at',
        thumbnail:
            'https://cdn.thingiverse.com/assets/c0/8a/0c/8d/d1/card_preview_7b9f487c-5a3b-467d-a54a-522728c47476.png')
            */
  ];

  /*This is an empty List to save all images when method get3DModel executes
    the http request. The ordes of execution is:
    1. Create a global empty List that can be use in anothers classes.
    2. Method get3DModel() execute http request
    3. Inside method get3DModel() let's create another List which is an instance
       of List that store http request data.
    4. Whe send the data to the global empty list created in Step 1 with addAll 
       using a map to iterate all data.
  */

  Future<void> get3DModel() async {
    //TODO: this is going to get http model

    //final myModel3D = await getModels3D.getModels3D();
    await getModels3D.getModels3D();

    //This is an intance for images list API https response
    final List<String> miListica = getModels3D.listavaciaImagenes;

    //This is a int list to generate 30 numbers for iterate list
    List<int> numeros = List.generate(30, (index) => index);

    //if (miListicaLlenita.isNotEmpty) return;
    miListicaLlenita.addAll(numeros.map((e) => miListica[e]));

    //Check if there's images to be loaded
    /*if (quantityLoaded < miListica.length) {
      //Upload next 5 images or less if there lower than 5
      int quantityToBeLoaded = 5;
      if (quantityLoaded + quantityToBeLoaded > miListica.length) {
        quantityLoaded = miListica.length - quantityLoaded;
      }

      //Add images
      for (int i = quantityLoaded;
          i < quantityLoaded + quantityToBeLoaded;
          i++) {
        models3D.add(Model3D(
            id: myModel3D.id,
            name: myModel3D.name,
            urlLink: myModel3D.urlLink,
            createdAt: myModel3D.createdAt,
            thumbnail: miListica[i]));
      }

      //Update quantity loaded
      quantityLoaded += quantityToBeLoaded;
    }*/

    notifyListeners();
  }
}
