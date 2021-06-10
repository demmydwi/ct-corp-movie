import 'package:assessment_test_ct_corp/model/movie.dart';
import 'package:assessment_test_ct_corp/presenter/moviepresenter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AddMovieScreen extends StatefulWidget {
  @override
  _AddMovieScreenState createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return AddMovieView();
  }
}

class AddMovieView extends StatefulWidget {
  @override
  _AddMovieViewState createState() => _AddMovieViewState();
}

class _AddMovieViewState extends State<AddMovieView> {
  MoviePresenter presenter;

  String title = 'Add Movie';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
  }

  loadData() async {
    if (presenter.selectedMovie.value != null) {
      title = 'Edit Movie';
      titleController.text = presenter.selectedMovie.value.title;
      directorController.text = presenter.selectedMovie.value.director;
      summaryController.text = presenter.selectedMovie.value.summary;
      imageUrlController.text = presenter.selectedMovie.value.imageUrl;
      selectedGenre = presenter.selectedMovie.value.tags;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    presenter = Provider.of<MoviePresenter>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: content,
    );
  }

  final titleController = TextEditingController();

  final directorController = TextEditingController();

  final summaryController = TextEditingController();

  final imageUrlController = TextEditingController();

  List<String> selectedGenre = [];

  Widget get appBar => AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.black87),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black87),
        actions: [
          presenter.selectedMovie.value == null
              ? SizedBox.shrink()
              : InkWell(
                  onTap: () {
                    presenter.removeMovieById(presenter.selectedMovie.value.id);
                    AutoRouter.of(context).pop();
                  },
                  child: Center(
                    child: Container(
                        margin: EdgeInsets.only(right: 12),
                        child: SvgPicture.asset(
                          'svg/delete.svg',
                          height: 24,
                          width: 24,
                          color: Colors.black87,
                        )),
                  ),
                ),
          InkWell(
            onTap: () {
              if (titleController.text.isEmpty ||
                  directorController.text.isEmpty) {
                showDialog(
                    context: context,
                    builder: (_) => SimpleDialog(
                          title: Text(
                            'Sorry',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          children: [
                            SimpleDialogOption(
                              child: Text(
                                'Movie title and director name is required, can not be empty.',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            SimpleDialogOption(
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                                textColor: Colors.white,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ));
                return;
              }
              if (presenter.selectedMovie.value == null) {
                presenter.addMovie(
                    title: titleController.text,
                    director: directorController.text,
                    summary: summaryController.text,
                    imageUrl: imageUrlController.text,
                    genre: selectedGenre ?? []);
              } else {
                presenter.updateMovie(
                    id: presenter.selectedMovie.value.id,
                    title: titleController.text,
                    director: directorController.text,
                    summary: summaryController.text,
                    imageUrl: imageUrlController.text,
                    genre: selectedGenre ?? []);
              }

              AutoRouter.of(context).pop();
            },
            child: Center(
              child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    'svg/send.svg',
                    height: 24,
                    width: 24,
                    color: Colors.black87,
                  )),
            ),
          ),
        ],
      );

  Widget get content => ListView(
        padding: EdgeInsets.all(20),
        children: [
          InputItemView(
            controller: titleController,
            hint: 'Movie Title',
          ),
          InputItemView(
            controller: directorController,
            hint: 'Director Name',
          ),
          InputItemView(
            controller: summaryController,
            hint: 'Movie Summary',
          ),
          InputItemView(
            controller: imageUrlController,
            hint: 'Movie Image Url',
          ),
          Text(
            'Movie Genre',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: genre
                .map((e) => InkWell(
                      onTap: () {
                        if (selectedGenre.contains(e)) {
                          selectedGenre.remove(e);
                        } else {
                          selectedGenre.add(e);
                        }
                        setState(() {});
                      },
                      child: TagItemView(
                        value: e,
                        isSelected: selectedGenre.contains(e),
                      ),
                    ))
                .toList(),
          )
        ],
      );
}

class InputItemView extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const InputItemView({Key key, this.hint, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 13,
              fontWeight: FontWeight.w500),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20, top: 4),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(6)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration.collapsed(hintText: 'Input $hint'),
          ),
        ),
      ],
    );
  }
}

class TagItemView extends StatefulWidget {
  final String value;
  final bool isSelected;

  const TagItemView({
    Key key,
    this.value,
    this.isSelected,
  }) : super(key: key);

  @override
  _TagItemViewState createState() => _TagItemViewState();
}

class _TagItemViewState extends State<TagItemView> {
  // bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
          color: !widget.isSelected ? Colors.white : Colors.black87,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color:
                  widget.isSelected ? Colors.black87 : Colors.grey.shade400)),
      child: Text(
        widget.value ?? 'Action',
        style: TextStyle(
            color: widget.isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 15),
      ),
    );
  }
}
