part of 'ed_st_add_cubit.dart';

@immutable
sealed class EdStAddState {}

final class EdStAddInitial extends EdStAddState {}

final class EdStAddLoading extends EdStAddState {}

final class EdStAddSuccess extends EdStAddState {}

final class EdStAddFailure extends EdStAddState {
  final String errorMessage;

  EdStAddFailure({required this.errorMessage});
}
