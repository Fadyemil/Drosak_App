part of 'groub_cubit.dart';

@immutable
sealed class GroubState {}

final class GroubInitial extends GroubState {}
final class GroubSucess extends GroubState {}