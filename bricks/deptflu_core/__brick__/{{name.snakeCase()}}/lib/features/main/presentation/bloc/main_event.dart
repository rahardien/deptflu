part of 'main_bloc.dart';

{{#using_equatable}}
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

{{/using_equatable}}

{{#using_freezed}}
@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.tapBottomNavMenu({required int index}) = _TapBottomNavMenu;
}
{{/using_freezed}}