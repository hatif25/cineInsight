import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final String title;
  final String rating;
  final String description;
  final String thumbnailUrl;
  MovieList({
    required this.title,
    required this.description,
    required this.rating,
    required this.thumbnailUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.color,
          ),
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.fitHeight,
          alignment: Alignment.topLeft,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              textAlign: TextAlign.left,
            ),
            alignment: Alignment(0.6, -1.0),
          ),
      Align(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6, // Adjust the width as needed
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  backgroundColor: Colors.white.withOpacity(0.8),
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
            alignment: Alignment(0.9, -0.6),
          ),
          Align(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(rating),
                      
                    ],
                  ),
                ),

              ],
            ),
            alignment: Alignment.bottomRight,
          ),

        ],
      ),
    );
  }
}
