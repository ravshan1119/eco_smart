part of 'home_screen_bloc.dart';

@immutable
class HomeScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class PageChanged extends HomeScreenEvent {
  PageChanged({required this.index});

  final int index;

  @override
  List<Object> get props => [index];
}
