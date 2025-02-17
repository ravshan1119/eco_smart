part of 'home_screen_bloc.dart';

class HomeScreenState extends Equatable {
  final int index;

  const HomeScreenState({this.index = 0});

  @override
  List<Object?> get props => [index];

  HomeScreenState copyWith({
    int? index,
  }) {
    return HomeScreenState(
      index: index ?? this.index,
    );
  }
}
