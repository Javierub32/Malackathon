import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackaton/pages/home_page.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    bool ready = await GRecaptchaV3.ready("6LdQUmQqAAAAAOHGT0yTuMR-uQGA9AAoPEHIbjI6"); //--2
    print("Is Recaptcha ready? $ready");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
