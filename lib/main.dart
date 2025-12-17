import 'package:civiid/Layout/startup.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengecek apakah ada token login yang tersimpan
    return MaterialApp(
      home: Startup(),
      theme: ThemeData(
        fontFamily: 'Manrope',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 56, 92, 221),
        ),
        useMaterial3: true,
      ),
    );
  }
}
