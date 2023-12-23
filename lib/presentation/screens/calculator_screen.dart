import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalculatorScreen extends StatefulWidget {
  static const String name = 'calculator_screen';
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final fonts = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: size.height * 0.65, //This upload the background image
            child: Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/calculator_background.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Positioned(
            width: size.width,
            bottom: size.height * 0.0,
            top: size.height * 0.16, // This upload the container design
            child: Container(
              height: size.width,
              width: size.height,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
            ),
          ),

          //Form design
          Form3DCalculator(size: size, fonts: fonts),
        ],
      ),
    );
  }
}

class Form3DCalculator extends StatelessWidget {
  const Form3DCalculator({
    super.key,
    required this.size,
    required this.fonts,
  });

  final Size size;
  final TextTheme fonts;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: size.width,
      bottom: size.height * 0.0,
      top: size.height * 0.14, // This upload/down form
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: ListView(
          children: [
            Text(
              textAlign: TextAlign.center,
              'Calculadora 3Dclic',
              style: fonts.titleMedium,
            ),
            Form(
                child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                SizedBox(
                  height: size.height * 0.06,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Datos de operación',
                    style: fonts.titleSmall,
                  ),
                ),
                SizedBox(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Tiempo de impresión
                      SizedBox(
                        width: size.width * 0.4,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              label: Text('Precio energia Kwh'),
                              prefixIcon: Icon(Icons.flash_on_rounded)),
                        ),
                      ),
                      //Cantidad de material
                      SizedBox(
                        width: size.width * 0.4,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              label: Text('Precio material(1gr)'),
                              prefixIcon: Icon(Icons.animation_outlined)),
                        ),
                      ),
                    ],
                  ),
                ),
                //Precio mano de obra
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text('Precio mano de obra'),
                      prefixIcon: Icon(Icons.people)),
                ),

                //Datos de impresión
                SizedBox(
                  height: size.height * 0.01,
                ),
                SizedBox(
                  height: size.height * 0.06,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Datos de impresión',
                    style: fonts.titleSmall,
                  ),
                ),
                SizedBox(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Tiempo de impresión
                      SizedBox(
                        width: size.width * 0.4,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              label: Text('Tiempo impresión'),
                              prefixIcon: Icon(Icons.timer)),
                        ),
                      ),
                      //Cantidad de material
                      SizedBox(
                        width: size.width * 0.4,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              label: Text('Cantidad material'),
                              prefixIcon:
                                  Icon(Icons.production_quantity_limits)),
                        ),
                      ),
                    ],
                  ),
                ),
                //Precio mano de obra
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text('Margen utilidad esperado'),
                      prefixIcon: Icon(Icons.percent)),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                FilledButton.icon(
                    onPressed: () {
                      /*showAboutDialog(
                          context: context,
                          children: [const Text('Licencias usadas')]);
                          */
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                              'El precio de venta calculado es: ...\n¿Desea guardar el calculo?'),
                          content: const Text(
                              'Sit consectetur nostrud deserunt do aliqua aliqua ullamco amet occaecat.'),
                          actions: [
                            TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                  label: Text('Nombre'),
                                  prefixIcon: Icon(Icons.abc)),
                            ),
                            FilledButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: const Text('Guardar')),
                            TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: const Text('No guardar')),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.attach_money_outlined),
                    label: Text(
                      'Calcular',
                      style: fonts.labelLarge,
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
