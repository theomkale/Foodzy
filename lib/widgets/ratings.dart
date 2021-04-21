import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final int rating;
  Rating(this.rating);
  @override
  Widget build(BuildContext context) {
    String stars="";
    for (var i = 0; i < rating; i++) {
      stars+='⭐ ';
    }
    return Text(stars.trim(),style: TextStyle(fontSize: 16),);
  }
}
