import 'package:assessment_test_ct_corp/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'model/movie.dart';
import 'presenter/moviepresenter.dart';
import 'router/app_router.gr.dart'; // Import the Counter

// final movie = Movie(); // Instanti

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final _appRouter = AppRouter(); // ate the store

  @override
  Widget build(BuildContext context) {
    return Provider<MoviePresenter>(
      create: (_) => MoviePresenter(),
      child:  MaterialApp.router(
        title: 'Movie App x CT Corp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}