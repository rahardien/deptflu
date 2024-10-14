import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/cores/initializer.dart';
import 'package:{{name.snakeCase()}}/cores/ui/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
{{#isRoutingGoRouter}}import 'package:{{name.snakeCase()}}/cores/routes/go_router/go_router_router.dart';{{/isRoutingGoRouter}}
{{#isRoutingGoRouter}}import 'package:{{name.snakeCase()}}/cores/routes/go_router/go_router_router.dart';{{/isRoutingGoRouter}}

{{#isRoutingGoRouter}}final router = Initializer.router;{{/isRoutingGoRouter}}

class {{name.pascalCase()}}App extends StatefulWidget {
  const {{name.pascalCase()}}App({super.key});

  static void setLocale(BuildContext context, Locale locale){
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
    {{^isRoutingNone}}return MaterialApp.router({{/isRoutingNone}}
    {{#isRoutingNone}}return MaterialApp({{/isRoutingNone}}
      title: "{{name.titleCase()}}",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
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
      {{#isRoutingGoRouter}}routerConfig: GorouterRouter.instance().routerConfig,{{/isRoutingGoRouter}}
    );
  }
}