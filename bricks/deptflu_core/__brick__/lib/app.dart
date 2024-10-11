import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/core/ui/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
    return MaterialApp(
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
      home: HomePage(title: AppLocalizations.of(context)?.name ?? "{{name.titleCase()}}",),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)?.language ?? "Undefined Language",
            ),
          ],
        ),
      ),
    );
  }
}
