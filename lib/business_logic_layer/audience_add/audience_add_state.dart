part of 'audience_add_cubit.dart';

@immutable
sealed class AudienceAddState {}

final class AudienceAddInitial extends AudienceAddState {}

final class AudienceAddLoading extends AudienceAddState {}

final class AudienceAddSuccess extends AudienceAddState {}

final class AudienceAddFailure extends AudienceAddState {
  final String error;

  AudienceAddFailure({required this.error});
}
