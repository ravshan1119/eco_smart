part of 'language_bloc.dart';

@immutable
class LanguageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LanguageChangedEvent extends LanguageEvent {
  LanguageChangedEvent({required this.languageCode});

  final String languageCode;

  @override
  List<Object> get props => [languageCode];
}
