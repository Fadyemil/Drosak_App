part of 'groub_add_cubit.dart';

@immutable
sealed class GroubAddState {}

final class GroubAddInitial extends GroubAddState {}


final class GroubLoading extends GroubAddState {}

final class GroubSuccess extends GroubAddState {}

final class GroubFailure extends GroubAddState {
  final String errorMessage;

  GroubFailure({required this.errorMessage});
}
