import 'package:assessment_test_ct_corp/view/add_movie_screen.dart';
import 'package:assessment_test_ct_corp/view/home_screen.dart';
import 'package:assessment_test_ct_corp/view/splash_screen.dart';
import 'package:auto_route/annotations.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: AddMovieScreen),
  ],
)
class $AppRouter {}