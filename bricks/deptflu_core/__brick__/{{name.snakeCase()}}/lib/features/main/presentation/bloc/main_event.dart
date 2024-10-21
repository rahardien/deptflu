part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class TapBottomNavMenuEvent extends MainEvent {
  final int index;

  const TapBottomNavMenuEvent(this.index);

  @override
  List<Object> get props => [index];
}
