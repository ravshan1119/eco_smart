part of 'language_bloc.dart';

class LanguageState extends Equatable {
  final String languageCode;

  const LanguageState({this.languageCode = 'uz'});

  @override
  List<Object?> get props => [languageCode];

  LanguageState copyWith({
    String? languageCode,
  }) {
    return LanguageState(
      languageCode: languageCode ?? this.languageCode,
    );
  }
}
