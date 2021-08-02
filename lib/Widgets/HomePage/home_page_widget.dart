import 'package:burgerjoint/Models/categories.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {

  // LIST OF IMAGES THAT WILL APPEAR AT THE TOP HOMEPAGE
  List<HomePageCategory> homePageCategories=[];


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
            // LIST OF IMAGES

            // GRID VIEW TO DISPLAY CATEGORIES

        ],
      ) ,
    );
  }

}
