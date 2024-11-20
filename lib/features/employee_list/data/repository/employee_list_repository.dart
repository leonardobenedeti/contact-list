import 'dart:convert';

import 'package:contact_list/features/employee_list/data/model/employee_model.dart';
import 'package:http/http.dart' as http;

class EmployeeListRepository {
  EmployeeListRepository();

  Future<List<Employee>> fetchEmployeeList() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/BeMobile/desafio-mobile/refs/heads/main/database.json'));
    if (response.statusCode == 200) {
      final employeeList = jsonDecode(response.body);
      return (employeeList['employees'] as List)
          .map((e) => Employee.fromJson(e))
          .toList();
    } else {
      throw Exception('Erro ao carregar os dados');
    }
  }
}
