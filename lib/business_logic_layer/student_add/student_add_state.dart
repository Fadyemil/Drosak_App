part of 'student_add_cubit.dart';

@immutable
sealed class StudentAddState {}

final class StudentAddInitial extends StudentAddState {}

final class StudentAddLoading extends StudentAddState {}

final class StudentAddSuccess extends StudentAddState {}

final class StudentAddFailure extends StudentAddState {
  final String error;

  StudentAddFailure({required this.error});
}
