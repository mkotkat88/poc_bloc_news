
import 'package:poc_bloc_new/res/app_localizations_delegate.dart';
import 'package:poc_bloc_new/ui/news/news_screen.dart';
import '../../res/app_context_extension.dart';
import '../../routes/route_generator.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: context.resources.color.colorPrimary,
      ),
      initialRoute: NewsScreen.id,
      onGenerateRoute: RouteGenerator().generateRoute,
      locale: const Locale("en"),
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
      ],

    );
  }
}
