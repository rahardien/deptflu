import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:{{name.snakeCase()}}/common/domain/repositories/auth_repository.dart';
import 'package:{{name.snakeCase()}}/common/presentation/bloc/auth_cubit.dart';
import 'package:{{name.snakeCase()}}/cores/injection.dart';
import 'package:{{name.snakeCase()}}/cores/ui/app_theme.dart';
import 'package:{{name.snakeCase()}}/cores/routes/go_router/go_router_router.dart';

class {{name.pascalCase()}}App extends StatefulWidget {
  const {{name.pascalCase()}}App({super.key});

  static void setLocale(BuildContext context, Locale locale) {
    final state = context.findAncestorStateOfType<_{{name.pascalCase()}}AppState>();
    state?.updateLocale(locale);
  }

  @override
  State<StatefulWidget> createState() => _{{name.pascalCase()}}AppState();
}

class _{{name.pascalCase()}}AppState extends State<{{name.pascalCase()}}App> {
  Locale? _locale;

  void updateLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(sl.get<AuthRepository>()),
        ),
      ],
      child: MaterialApp.router(
        title: "{{name.titleCase()}}",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.defaultTheme,
        locale: _locale ?? const Locale('id'),
        supportedLocales: const [
          Locale('en'),
          Locale('id'),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerConfig: GorouterRouter.router,
      ),
    );
  }
}
