import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:teka_3dclic/services/get_3dmodels.dart';

import '../providers/provider_3dclic.dart';

class Models3dScreen extends StatefulWidget {
  static const String name = 'models_3d_screen';

  const Models3dScreen({super.key});

  @override
  State<Models3dScreen> createState() => _Models3dScreenState();
}

class _Models3dScreenState extends State<Models3dScreen> {
  // bool isLoading = false;
  //This is an instance from dio http request to get model
  final GetModels3D getModels3D = GetModels3D();

  final List<String> listica = [];

  //This is the scrollcontroller
  final scrollController = ScrollController();

  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    loadingImages();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    isMounted = false;
    super.dispose();
  }

  Future loadingImages() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));
    addImages();
    setState(() {});
    isLoading = false;
    //TODO: CHECK IF WIDGET COMPONENT IS MOUNTED
    if (!isMounted) return;
    setState(() {});
  }

  void addImages() {
    //This is an intance of provider

    final miProvider = Provider.of<Clic3DProvider>(context, listen: false);

    if (miProvider.miListicaLlenita.isEmpty) {
      miProvider.get3DModel();
    }
    //This is an intance for images to get data from Global List Provider
    List<String> miListicaLlenita = miProvider.miListicaLlenita;
    listica.addAll(miListicaLlenita);

    //This is a int list to generate 30 numbers
    //List<int> numberImagesAdded = List.generate(5, (index) => index);

    //This is for store images loaded
    //int quantityLoaded = 0;

    //
    /*
    //Check if there's images to be loaded
    if (quantityLoaded < miListicaLlenita.length) {
      //Upload next 5 images or less if there lower than 5
      int quantityToBeLoaded = 4;
      if (quantityLoaded + quantityToBeLoaded > miListicaLlenita.length) {
        quantityLoaded = miListicaLlenita.length - quantityLoaded;
      }

      //Add images
      for (int i = quantityLoaded;
          i < quantityLoaded + quantityToBeLoaded;
          i++) {
        listica.add(miListicaLlenita[i]);
      }

      //Update quantity loaded
      quantityLoaded += quantityToBeLoaded;
    }*/
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final size = MediaQuery.of(context).size;

    final chatProvider = context.watch<Clic3DProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: colors.primary,
                ),
              )
            : ListView.builder(
                itemCount: chatProvider.miListicaLlenita.length,
                itemBuilder: (context, index) {
                  final message2 = chatProvider.miListicaLlenita;
                  final message = message2[index];
                  return Card(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.all(5),
                    elevation: 10,
                    child: Stack(children: [
                      FadeInImage(
                        fit: BoxFit.cover,
                        width: size.width,
                        height: size.height * 0.5,
                        placeholderFit: BoxFit.contain,
                        placeholder: const AssetImage(
                            'assets/images/animation_loading_images.gif'),
                        image: NetworkImage(message),
                        //'${imageIds[index]}/500/300'),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: colors.primary,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20)),
                          ),
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                      'Electrical Tape Dispenser (Duck Brand 282289 Economy)'),
                                  content: const Text(
                                      'https://www.thingiverse.com/thing:6204719'),
                                  actions: [
                                    FilledButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: const Text('Ir a link')),
                                    TextButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: const Text('Salir')),
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(Icons.more_vert_rounded),
                            color: Colors.white,
                          ),
                        ),
                      )
                    ]),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: colors.primary,
        backgroundColor: colors.primaryContainer,
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
