import 'package:assessment_test_ct_corp/presenter/moviepresenter.dart';
import 'package:assessment_test_ct_corp/router/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  toMainPage() async {
    await Future.delayed(Duration(seconds: 2));
    Provider.of<MoviePresenter>(context, listen: false).addDummyMovies();
    AutoRouter.of(context).replace(HomeScreen());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toMainPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.movie_filter,
              color: Colors.black87,
              size: 52,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Movie App CT Corp',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
