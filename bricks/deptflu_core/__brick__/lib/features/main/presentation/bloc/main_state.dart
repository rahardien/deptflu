part of 'main_bloc.dart';

class MainState extends Equatable {
  final int activeNavIndex;

  const MainState({
    this.activeNavIndex = 0,
  });

  @override
  List<Object> get props => [
        activeNavIndex,
      ];

  MainState copyWith({
    int? activeNavIndex,
  }) =>
      MainState(
        activeNavIndex: activeNavIndex ?? this.activeNavIndex,
      );
}
