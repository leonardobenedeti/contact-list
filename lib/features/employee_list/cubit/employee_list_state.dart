part of 'employee_list_cubit.dart';

sealed class EmployeeListState {
  const EmployeeListState();
}

final class EmployeeListInitial extends EmployeeListState {}

final class EmployeeListLoading extends EmployeeListState {}

final class EmployeeListError extends EmployeeListState {}

final class EmployeeListSuccess extends EmployeeListState {
  List<Employee> employeeList;
  EmployeeListSuccess(this.employeeList);
}
