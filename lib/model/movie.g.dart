// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Movie on _Movie, Store {
  final _$idAtom = Atom(name: '_Movie.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$titleAtom = Atom(name: '_Movie.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$directorAtom = Atom(name: '_Movie.director');

  @override
  String get director {
    _$directorAtom.reportRead();
    return super.director;
  }

  @override
  set director(String value) {
    _$directorAtom.reportWrite(value, super.director, () {
      super.director = value;
    });
  }

  final _$summaryAtom = Atom(name: '_Movie.summary');

  @override
  String get summary {
    _$summaryAtom.reportRead();
    return super.summary;
  }

  @override
  set summary(String value) {
    _$summaryAtom.reportWrite(value, super.summary, () {
      super.summary = value;
    });
  }

  final _$imageUrlAtom = Atom(name: '_Movie.imageUrl');

  @override
  String get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  final _$tagsAtom = Atom(name: '_Movie.tags');

  @override
  List<String> get tags {
    _$tagsAtom.reportRead();
    return super.tags;
  }

  @override
  set tags(List<String> value) {
    _$tagsAtom.reportWrite(value, super.tags, () {
      super.tags = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
director: ${director},
summary: ${summary},
imageUrl: ${imageUrl},
tags: ${tags}
    ''';
  }
}
