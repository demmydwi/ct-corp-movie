// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import '../view/add_movie_screen.dart' as _i4;
import '../view/home_screen.dart' as _i3;
import '../view/splash_screen.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.SplashScreen());
    },
    HomeScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i3.HomeScreen());
    },
    AddMovieScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i4.AddMovieScreen());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashScreen.name, path: '/'),
        _i1.RouteConfig(HomeScreen.name, path: '/home-screen'),
        _i1.RouteConfig(AddMovieScreen.name, path: '/add-movie-screen')
      ];
}

class SplashScreen extends _i1.PageRouteInfo {
  const SplashScreen() : super(name, path: '/');

  static const String name = 'SplashScreen';
}

class HomeScreen extends _i1.PageRouteInfo {
  const HomeScreen() : super(name, path: '/home-screen');

  static const String name = 'HomeScreen';
}

class AddMovieScreen extends _i1.PageRouteInfo {
  const AddMovieScreen() : super(name, path: '/add-movie-screen');

  static const String name = 'AddMovieScreen';
}
