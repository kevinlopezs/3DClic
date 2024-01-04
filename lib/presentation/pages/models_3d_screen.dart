import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Models3dScreen extends StatefulWidget {
  const Models3dScreen({super.key});

  @override
  State<Models3dScreen> createState() => _Models3dScreenState();
}

class _Models3dScreenState extends State<Models3dScreen> {
  //This is the scrollcontroller
  final scrollController = ScrollController();

  bool isLoading = false;
  bool isMounted = true;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

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
                itemCount: 5,
                itemBuilder: (context, index) {
                  final message2 = 'okay';

                  return Card(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.all(5),
                    elevation: 10,
                    child: Stack(children: [
                      Image.asset('assets/images/animation_loading_images.gif'),
                      /*FadeInImage(
                        fit: BoxFit.cover,
                        width: size.width,
                        height: size.height * 0.5,
                        placeholderFit: BoxFit.contain,
                        placeholder: const AssetImage(
                            'assets/images/animation_loading_images.gif'),
                            
                        image: ,
                        
                      ),*/
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
                              showItemDetailsDialog(context);
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

void showItemDetailsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title:
          const Text('Electrical Tape Dispenser (Duck Brand 282289 Economy)'),
      content: const Text('https://www.thingiverse.com/thing:6204719'),
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
}
