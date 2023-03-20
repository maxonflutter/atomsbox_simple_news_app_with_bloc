import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_client/news_api_client.dart';

import 'repositories/repositories.dart';
import 'ui/ui.dart';
import 'ui/widgets/widgets.dart';

void main() {
  NewsApiClient newsApiClient = NewsApiClient.localhost();

  runApp(
    App(newsApiClient: newsApiClient),
  );
}

class App extends StatelessWidget {
  const App({
    super.key,
    required this.newsApiClient,
  });

  final NewsApiClient newsApiClient;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => NewsRepository(newsApiClient: newsApiClient),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BottomNavBarCubit()..start()),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'News App with the simple design system from atomsbox (atomsbox.com)',
      theme: simpleAppTheme(),
      home: const NewsFeedScreen(),
    );
  }
}
