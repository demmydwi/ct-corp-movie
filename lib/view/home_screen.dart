import 'package:assessment_test_ct_corp/model/movie.dart';
import 'package:assessment_test_ct_corp/presenter/moviepresenter.dart';
import 'package:assessment_test_ct_corp/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';

import 'movie_item_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        body: HomeListView());
  }
}

class HomeListView extends StatefulWidget {
  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  // MovieList get presenter => Provider.of<MovieList>(context);

  @override
  Widget build(BuildContext context) {
    final MoviePresenter presenter = Provider.of<MoviePresenter>(context);

    return Observer(
      builder: (_) => Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: SafeArea(
                  bottom: false,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello !',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black87),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Here is your movie presenter',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black87,
                                  letterSpacing: 0.5),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          presenter.selectedMovie.value = null;
                          AutoRouter.of(context).push(AddMovieScreen());
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(
                            'svg/plus.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      )
                    ],
                  ))),
          SizedBox(
            height: 24,
          ),
          Expanded(
              child: presenter.isEmpty
                  ? Center(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Text(presenter.itemsDescription),
                      ),
                    )
                  : ListView(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      children: presenter.movies
                          .map((e) => InkWell(
                              onTap: () {
                                presenter.selectedMovie.value = e;
                                AutoRouter.of(context).push(AddMovieScreen());
                              },
                              child: MovieItemView(movie: e)))
                          .toList())),
        ],
      ),
    );
  }
}
