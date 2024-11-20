import 'package:contact_list/constants/theme.dart';
import 'package:contact_list/features/employee_list/ui/employee_list_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: CustomTheme.themeData,
      home: const EmployeeListBuilder(),
    );
  }
}
