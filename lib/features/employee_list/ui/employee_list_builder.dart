import 'package:contact_list/features/employee_list/cubit/employee_list_cubit.dart';
import 'package:contact_list/features/employee_list/ui/employee_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeListBuilder extends StatelessWidget {
  const EmployeeListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmployeeListCubit>(
      create: (context) => EmployeeListCubit()..fetchList(),
      child: const EmployeeListScreen(),
    );
  }
}
