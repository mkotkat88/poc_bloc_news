import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/news/news_bloc.dart';
import '../../data_layer/model/news/news_model.dart';
import '../ui/news/news_detail_screen.dart';
import '../../ui/news/news_screen.dart';


class RouteGenerator {

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {

      case NewsDetailScreen.id:
        return MaterialPageRoute(
          builder: (context) {
            return NewsDetailScreen(objArticle: args as Article);
          },
        );

      case NewsScreen.id:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NewsBloc>.value(
            value: NewsBloc(),
            child: const NewsScreen(),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error while loading news page'),
        ),
      );
    });
  }
}
