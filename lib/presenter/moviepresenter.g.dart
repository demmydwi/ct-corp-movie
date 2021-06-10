// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moviepresenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoviePresenter on _MoviePresenter, Store {
  Computed<bool>_$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??=
          Computed<bool>(() => super.isEmpty, name: '_MoviePresenter.isEmpty'))
      .value;
  Computed<int>_$latestIndexComputed;

  @override
  int get latestIndex =>
      (_$latestIndexComputed ??= Computed<int>(() => super.latestIndex,
              name: '_MoviePresenter.latestIndex'))
          .value;
  Computed<String>_$newIndexComputed;

  @override
  String get newIndex =>
      (_$newIndexComputed ??= Computed<String>(() => super.newIndex,
              name: '_MoviePresenter.newIndex'))
          .value;
  Computed<String>_$itemsDescriptionComputed;

  @override
  String get itemsDescription => (_$itemsDescriptionComputed ??=
          Computed<String>(() => super.itemsDescription,
              name: '_MoviePresenter.itemsDescription'))
      .value;

  final _$moviesAtom = Atom(name: '_MoviePresenter.movies');

  @override
  ObservableList<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$selectedMovieAtom = Atom(name: '_MoviePresenter.selectedMovie');

  @override
  Observable<Movie> get selectedMovie {
    _$selectedMovieAtom.reportRead();
    return super.selectedMovie;
  }

  @override
  set selectedMovie(Observable<Movie> value) {
    _$selectedMovieAtom.reportWrite(value, super.selectedMovie, () {
      super.selectedMovie = value;
    });
  }

  final _$_MoviePresenterActionController =
      ActionController(name: '_MoviePresenter');

  @override
  void selectMovie({Movie movie}) {
    final _$actionInfo = _$_MoviePresenterActionController.startAction(
        name: '_MoviePresenter.selectMovie');
    try {
      return super.selectMovie(movie: movie);
    } finally {
      _$_MoviePresenterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMovie(
      {String title,
      String director,
      String summary,
      String imageUrl,
      List<String> genre}) {
    final _$actionInfo = _$_MoviePresenterActionController.startAction(
        name: '_MoviePresenter.addMovie');
    try {
      return super.addMovie(
          title: title,
          director: director,
          summary: summary,
          imageUrl: imageUrl,
          genre: genre);
    } finally {
      _$_MoviePresenterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addDummyMovies() {
    final _$actionInfo = _$_MoviePresenterActionController.startAction(
        name: '_MoviePresenter.addDummyMovies');
    try {
      return super.addDummyMovies();
    } finally {
      _$_MoviePresenterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateMovie(
      {String id,
      String title,
      String director,
      String summary,
      String imageUrl,
      List<String> genre}) {
    final _$actionInfo = _$_MoviePresenterActionController.startAction(
        name: '_MoviePresenter.updateMovie');
    try {
      return super.updateMovie(
          id: id,
          title: title,
          director: director,
          summary: summary,
          imageUrl: imageUrl,
          genre: genre);
    } finally {
      _$_MoviePresenterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeMovie(Movie movie) {
    final _$actionInfo = _$_MoviePresenterActionController.startAction(
        name: '_MoviePresenter.removeMovie');
    try {
      return super.removeMovie(movie);
    } finally {
      _$_MoviePresenterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeMovieById(String id) {
    final _$actionInfo = _$_MoviePresenterActionController.startAction(
        name: '_MoviePresenter.removeMovieById');
    try {
      return super.removeMovieById(id);
    } finally {
      _$_MoviePresenterActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
selectedMovie: ${selectedMovie},
isEmpty: ${isEmpty},
latestIndex: ${latestIndex},
newIndex: ${newIndex},
itemsDescription: ${itemsDescription}
    ''';
  }
}
