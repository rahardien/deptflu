import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:{{name.snakeCase()}}/common/presentation/bloc/auth_cubit.dart';
import 'package:{{name.snakeCase()}}/cores/constants/auth_constants.dart';
import 'package:{{name.snakeCase()}}/cores/routes/app_navigation.dart';
import 'package:{{name.snakeCase()}}/cores/routes/routes.dart';
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
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (_, state) {
            if (state.status == AuthStatus.unauthenticated) {
              AppNavigation.instance.pushNamedReplacement(
                context: context,
                name: Routes.login,
              );
            }
          },
        ),
        BlocListener<MainBloc, MainState>(
          listenWhen: (prev, curr) =>
              prev.activeNavIndex != curr.activeNavIndex,
          listener: (_, state) {
            context.go(
              context.read<MainBloc>().navItems[state.activeNavIndex].path,
            );
          },
        ),
      ],
      child: Scaffold(
        body: child,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
            ),
          ],
        ),
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
                {{#using_equatable}}context.read<MainBloc>().add(TapBottomNavMenuEvent(index));{{/using_equatable}}
                {{#using_freezed}}context.read<MainBloc>().add(MainEvent.tapBottomNavMenu(index: index));{{/using_freezed}}
              },
            );
          },
        ),
      ),
    );
  }
}
