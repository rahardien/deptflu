import 'package:{{name.snakeCase()}}/cores/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/get_main_uc.dart';

part 'main_event.dart';
part 'main_state.dart';

class BottomNavigationItem {
  final String label;
  final String path;
  final Widget icon;
  final Widget activeIcon;

  BottomNavigationItem({
    required this.label,
    required this.path,
    required this.icon,
    required this.activeIcon,
  });
}

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetMainUc getMainUc;

  final navItems = <BottomNavigationItem>[
    BottomNavigationItem(
      label: "Home",
      path: "/${Routes.home}",
      icon: const Icon(Icons.home_outlined),
      activeIcon: const Icon(Icons.home_filled),
    ),
    BottomNavigationItem(
      label: "History",
      path: "/${Routes.history}",
      icon: const Icon(Icons.timeline_outlined),
      activeIcon: const Icon(Icons.timeline),
    ),
    BottomNavigationItem(
      label: "Notification",
      path: "/${Routes.notification}",
      icon: const Icon(Icons.notifications_outlined),
      activeIcon: const Icon(Icons.notifications),
    ),
    BottomNavigationItem(
      label: "Profile",
      path: "/${Routes.profile}",
      icon: const Icon(Icons.person_outline),
      activeIcon: const Icon(Icons.person),
    ),
  ];

  MainBloc({required this.getMainUc}) : super(const MainState()) {
    on<TapBottomNavMenuEvent>((event, emit) {
      emit(state.copyWith(activeNavIndex: event.index));
    });
  }
}
