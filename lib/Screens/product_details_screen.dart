import 'package:burgerjoint/Widgets/custom_appbar.dart';
import 'package:burgerjoint/Widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double price;
  final int id;
  ProductDetailsScreen({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.id,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: DrawerWidget(),
        appBar: CustomAppBar(
            title: "DELIVERING TO",
            backgroundColor: '#ED1C24',
            onChanged: (value) {
              if (value) {
                _key.currentState!.openDrawer();
              }
            }),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  color: Color(0xffED1C24),
                  iconSize: 26,
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "$title",
                      style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Color(0xffF80009),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
