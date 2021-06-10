import 'package:assessment_test_ct_corp/model/movie.dart';
import 'package:flutter/material.dart';

class MovieItemView extends StatelessWidget {
  final Movie movie;

  const MovieItemView({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade50),
      child: Row(
        children: [
          movie.imageUrl != null && movie.imageUrl.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    movie.imageUrl,
                    height: double.infinity,
                    width: 72,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  height: double.infinity,
                  width: 72,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey),
                  child: Icon(Icons.image_not_supported),
                ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  movie.director,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                Expanded(child: SizedBox.shrink()),
                Text(
                  movie.tags.map((e) => e).join(', '),
                  style: TextStyle(fontSize: 12),
                  maxLines: 1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
