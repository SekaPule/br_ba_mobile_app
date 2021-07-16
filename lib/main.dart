import 'package:brba/pages/allCharactersPage.dart';
import 'package:brba/pages/characterPage.dart';
import 'package:brba/pages/randomCharacterPage.dart';
import 'package:brba/pages/quotesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'first/bloc/first_bloc.dart';
import 'second/bloc/second_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FirstBloc>(
          create: (context) => FirstBloc()..add(InitialFirst()),
        ),
        BlocProvider<SecondBloc>(
          create: (context) => SecondBloc()..add(InitialSecond()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "brba",
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        initialRoute: '/',
        onGenerateRoute: (routeSettings) {
          switch (routeSettings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (context) => AllCharactersPage(),
                  settings: routeSettings);
            case '/character':
              return MaterialPageRoute(
                  builder: (context) => Character(), settings: routeSettings);
            case '/quotes':
              return MaterialPageRoute(
                  builder: (context) => QuotesPage(), settings: routeSettings);
            case '/randchar':
              return MaterialPageRoute(
                  builder: (context) => RandomCharacterPage(),
                  settings: routeSettings);
            case '/allchar':
              return MaterialPageRoute(
                  builder: (context) => AllCharactersPage(),
                  settings: routeSettings);
            default:
              return MaterialPageRoute(
                  builder: (context) => AllCharactersPage(),
                  settings: routeSettings);
          }
        },
      ),
    );
  }
}
