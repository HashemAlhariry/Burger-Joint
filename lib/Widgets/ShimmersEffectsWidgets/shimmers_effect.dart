import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {

  final double width;
  final double height;
  ShimmerEffect(this.height,this.width);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(child: Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        color: Colors.grey,
      ),
    ), baseColor: Colors.grey[300] ?? Colors.grey, highlightColor: Colors.white);
  }
}
