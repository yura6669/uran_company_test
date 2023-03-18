import 'package:flutter/material.dart';
import 'package:uran_company_test/modules/exhibits_screen.dart';

class UranCompanyApp extends StatelessWidget {
  const UranCompanyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExhibitsScreen(),
    );
  }
}
