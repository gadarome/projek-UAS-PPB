import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:pack_tookang/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:pack_tookang/ui/home_screen.dart';
import 'package:pack_tookang/ui/mortar.dart';
import 'package:pack_tookang/ui/splash.dart';
import 'package:pack_tookang/ui/utils/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pack_tookang",
      debugShowCheckedModeBanner: false,
      navigatorKey: NAV_KEY,
      onGenerateRoute: generateRoute,
      home: SplashScreen()
    );
  }
}
