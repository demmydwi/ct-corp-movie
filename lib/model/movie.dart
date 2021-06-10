import 'package:mobx/mobx.dart';

part 'movie.g.dart';

// This is the class used by rest of your codebase

List genre =  ["Action", 'Comedy', 'Fantasy', 'Horror', 'SciFi'];

class Movie = _Movie with _$Movie;

// The store-class
abstract class _Movie with Store {
  _Movie(
    this.id,
    this.title,
    this.director,
    this.summary,
    this.imageUrl,
    this.tags,
  );

  @observable
  String id = '';

  @observable
  String title = '';

  @observable
  String director = '';

  @observable
  String summary = '';

  @observable
  String imageUrl = '';

  @observable
  List<String> tags = [];
}
