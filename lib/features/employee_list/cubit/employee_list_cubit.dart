import 'package:contact_list/features/employee_list/data/model/employee_model.dart';
import 'package:contact_list/features/employee_list/data/repository/employee_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'employee_list_state.dart';

class EmployeeListCubit extends Cubit<EmployeeListState> {
  EmployeeListCubit()
      : repository = EmployeeListRepository(),
        super(EmployeeListInitial());

  EmployeeListRepository repository;

  Future<void> fetchList() async {
    emit(EmployeeListLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 400));
      final response = await repository.fetchEmployeeList();
      emit(EmployeeListSuccess(response));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> filterList(String query, List<Employee> employees) async {
    try {
      final filteredList = employees.where((employee) {
        final queryLower = query.toLowerCase();
        return employee.name.toLowerCase().contains(queryLower) ||
            employee.job.toLowerCase().contains(queryLower) ||
            employee.admissionDate
                .toString()
                .toLowerCase()
                .contains(queryLower) ||
            employee.phone.toLowerCase().contains(queryLower);
      }).toList();

      emit(EmployeeListSuccess(filteredList));
    } catch (e) {
      rethrow;
    }
  }
}
