
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<LanguageChangedEvent>(_onLanguageChanged);
  }

  void _onLanguageChanged(LanguageChangedEvent event, Emitter<LanguageState> emit) {
    emit(
      state.copyWith(
        languageCode: event.languageCode,
      ),
    );
  }
}
