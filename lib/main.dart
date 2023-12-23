import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teka_3dclic/config/router/app_router.dart';
import 'package:teka_3dclic/config/theme/app_theme.dart';
import 'package:teka_3dclic/presentation/providers/provider_3dclic.dart';

//import 'package:teka_3dclic/presentation/screens/auth/welcome.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  //This is for splashscreen

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Clic3DProvider(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 6, selectedFont: 1).getTheme(),
        //home: const Welcome(),
      ),
    );
  }
}
