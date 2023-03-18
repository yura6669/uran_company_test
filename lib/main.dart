import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uran_company_test/core/locator.dart';
import 'package:uran_company_test/uran_company_app.dart';

void main() async {
  setupServiceLocator();
  Hive.initFlutter();
  runApp(const UranCompanyApp());
}
