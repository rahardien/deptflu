import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/news_bloc.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetIt.I.get<NewsBloc>(),
        ),
      ],
      child: const _NewsLayout(),
    );
  }
}

class _NewsLayout extends StatelessWidget {
  const _NewsLayout();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("News Page"),
      ),
    );
  }
}
