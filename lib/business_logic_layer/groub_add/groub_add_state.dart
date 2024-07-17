part of 'groub_add_cubit.dart';

@immutable
sealed class GroubAddState {}

final class GroubAddInitial extends GroubAddState {}

final class GroubAddLoading extends GroubAddState {}

final class GroubaddSuccess extends GroubAddState {}

final class GroubAddFailure extends GroubAddState {
  final String errorMessage;

  GroubAddFailure({required this.errorMessage});
}
