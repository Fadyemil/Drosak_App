part of 'audience_cubit.dart';

@immutable
sealed class AudienceState {}

final class AudienceInitial extends AudienceState {}
final class AudienceSucess extends AudienceState {}
