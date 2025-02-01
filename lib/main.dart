import 'package:flutter/material.dart';
import 'package:printer_marketplace/pages/home.dart';
import 'package:printer_marketplace/themes/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Printer Marketplace',
      theme: ThemeData(
          scaffoldBackgroundColor: primaryColor,
          useMaterial3: true,
          dividerTheme: const DividerThemeData(
            space: 30,
            indent: 15,
            endIndent: 15,
          )),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
