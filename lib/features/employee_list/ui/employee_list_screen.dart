import 'package:contact_list/constants/colors.dart';
import 'package:contact_list/constants/spacing.dart';
import 'package:contact_list/features/employee_list/cubit/employee_list_cubit.dart';
import 'package:contact_list/features/employee_list/data/model/employee_model.dart';
import 'package:contact_list/utils/phone_formatter.dart';
import 'package:contact_list/widgets/appbar_widget.dart';
import 'package:contact_list/widgets/dashed_border_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final searchController = TextEditingController();
  List<Employee> _employees = [];
  List<int> itemsExpanded = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Funcionários',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: Spacing.sm),
            TextField(
              controller: searchController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  context
                      .read<EmployeeListCubit>()
                      .filterList(value, _employees);
                } else {
                  context.read<EmployeeListCubit>().fetchList();
                }
              },
              decoration: InputDecoration(
                hintText: 'Pesquisar',
                prefixIcon: const Icon(Icons.search, color: Colors.black),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<EmployeeListCubit, EmployeeListState>(
                listener: (context, state) {
                  if (state is EmployeeListSuccess) {
                    setState(() {
                      _employees = state.employeeList;
                    });
                  }
                },
                builder: (context, state) {
                  if (state is EmployeeListLoading ||
                      state is EmployeeListInitial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is EmployeeListSuccess) {
                    if (_employees.isEmpty) {
                      return emptyWidget(
                        message:
                            'Não encontramos uma correspondência ao termo procurado',
                        icon: Icons.search_off_outlined,
                      );
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: Spacing.lg),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          decoration: const BoxDecoration(
                            color: CustomColors.blue10,
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: CustomColors.gray10,
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            leading: Text(
                              'Foto',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            title: Text(
                              'Nome',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            trailing: const Icon(
                              Icons.circle,
                              size: 8,
                              color: CustomColors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _employees.length,
                            itemBuilder: (context, index) {
                              final employee = _employees[index];
                              return ExpansionTile(
                                collapsedShape: const Border.fromBorderSide(
                                  BorderSide(
                                    color: CustomColors.gray10,
                                  ),
                                ),
                                shape: const Border.fromBorderSide(
                                  BorderSide(
                                    color: CustomColors.gray10,
                                  ),
                                ),
                                tilePadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                leading: CircleAvatar(
                                  radius: 24,
                                  backgroundImage: NetworkImage(employee.image),
                                ),
                                onExpansionChanged: (value) {
                                  setState(() {
                                    if (value) {
                                      itemsExpanded.add(index);
                                    } else {
                                      itemsExpanded.remove(index);
                                    }
                                  });
                                },
                                title: Text(
                                  employee.name,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                trailing: AnimatedRotation(
                                  turns:
                                      itemsExpanded.contains(index) ? 0.5 : 0,
                                  duration: const Duration(milliseconds: 300),
                                  child: const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 32,
                                    color: CustomColors.bluePrimary,
                                  ),
                                ),
                                childrenPadding: const EdgeInsets.all(16),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DashedBorderContainer(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Cargo",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium,
                                              ),
                                              Text(
                                                employee.job,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                        DashedBorderContainer(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Data de admissão",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium,
                                              ),
                                              Text(
                                                DateFormat('dd/MM/yyyy').format(
                                                    employee.admissionDate),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                        DashedBorderContainer(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Telefone",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium,
                                              ),
                                              Text(
                                                formatPhoneNumber(
                                                    employee.phone),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }

                  return emptyWidget(
                    message: 'Não foi possível mostrar a lista de funcionários',
                    icon: Icons.warning,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emptyWidget({
    required String message,
    IconData icon = Icons.warning,
  }) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: CustomColors.bluePrimary,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
