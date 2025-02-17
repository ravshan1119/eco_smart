
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(const HomeScreenState()) {
    on<PageChanged>(_onPageChanged);
  }

  void _onPageChanged(PageChanged event, Emitter<HomeScreenState> emit) {
    emit(
      state.copyWith(
        index: event.index,
      ),
    );
  }
}
