import 'dart:math';

import 'package:mobx/mobx.dart';

import '../model/movie.dart';

part 'moviepresenter.g.dart';

class MoviePresenter = _MoviePresenter with _$MoviePresenter;

abstract class _MoviePresenter with Store {
  @observable
  ObservableList<Movie> movies = ObservableList<Movie>();

  @observable
  Observable<Movie> selectedMovie = Observable<Movie>(null);

  @computed
  bool get isEmpty => movies.isEmpty;

  @computed
  int get latestIndex =>
      isEmpty ? 0 : movies.map((e) => int.tryParse(e.id) ?? 0).reduce(max);

  @computed
  String get newIndex => (latestIndex + 1).toString();

  @computed
  String get itemsDescription {
    if (isEmpty) {
      return "There is no Movie found. Why don't you add one?.";
    }

    final suffix = movies.length == 1 ? 'movie' : 'movies';
    return 'There are $suffix found';
  }

  @action
  void selectMovie({Movie movie}) {
    selectedMovie.value = movie;
  }

  @action
  void addMovie({
    String title,
    String director,
    String summary,
    String imageUrl,
    List<String> genre,
  }) {
    final movie = Movie(newIndex, title, director, summary, imageUrl, genre);
    movies.add(movie);
  }

  @action
  void addDummyMovies() {
    movies.addAll([
      Movie(
          '0',
          'F9 - The Fast Saga',
          'Justin Lin',
          '-',
          'https://m.media-amazon.com/images/M/MV5BMjI0NmFkYzEtNzU2YS00NTg5LWIwYmMtNmQ1MTU0OGJjOTMxXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_.jpg',
          ['Action', 'Comedy']),
      Movie(
          '1',
          'Godzilla vs. Kong',
          'Adam Wingard',
          '-',
          'https://cdn0-production-images-kly.akamaized.net/sQw5tZ3b62ctXfIlfBCPuWDWaqs=/640x853/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3357282/original/011806600_1611383440-EsRUFLjU0AEggnI-700x1037.jpeg',
          ['Action']),
      Movie(
          '2',
          'Space Sweeper',
          'Jo Sung-hee',
          '-',
          'https://upload.wikimedia.org/wikipedia/en/0/05/Space_Sweepers.jpg',
          ['Comedy', 'SciFi']),
    ]);
  }

  @action
  void updateMovie({
    String id,
    String title,
    String director,
    String summary,
    String imageUrl,
    List<String> genre,
  }) {
    final movie = Movie(id, title, director, summary, imageUrl, genre);
    final index = movies.indexWhere((e) => e.id == id);
    // removeMovieById(id);
    movies[index] = movie;
  }

  @action
  void removeMovie(Movie movie) {
    movies.removeWhere((x) => x.id == movie.id);
  }

  @action
  void removeMovieById(String id) {
    movies.removeWhere((x) => x.id == id);
  }
}
