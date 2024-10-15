import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/main_bloc.dart';

class MainPage extends StatelessWidget {
  final Widget child;

  const MainPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetIt.instance.get<MainBloc>(),
        ),
      ],
      child: _MainLayout(child: child),
    );
  }
}

class _MainLayout extends StatelessWidget {
  final Widget child;

  const _MainLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BlocBuilder<MainBloc, MainState>(
        builder: (_, state) {
          return BottomNavigationBar(
            currentIndex: state.activeNavIndex,
            elevation: 2,
            backgroundColor: Theme.of(context).colorScheme.surface,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.outline,
            items: context
                .read<MainBloc>()
                .navItems
                .map((e) => BottomNavigationBarItem(
                      icon: e.icon,
                      activeIcon: e.activeIcon,
                      label: e.label,
                    ))
                .toList(),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: (index) {
              context.go(context.read<MainBloc>().navItems[index].path);
              context.read<MainBloc>().add(TapBottomNavMenuEvent(index));
            },
          );
        },
      ),
    );
  }
}
