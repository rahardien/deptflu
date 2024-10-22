part of 'main_bloc.dart';

{{#using_equatable}}
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
{{/using_equatable}}

{{#using_freezed}}
@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(0) int activeNavIndex,
  }) = _MainState;
}
{{/using_freezed}}