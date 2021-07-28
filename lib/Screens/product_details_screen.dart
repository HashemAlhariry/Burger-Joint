import 'package:burgerjoint/Widgets/custom_appbar.dart';
import 'package:burgerjoint/Widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFED1C24),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .5,
                    height: 30,
                    child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Searching...",
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 14),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 20,
                          )),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_rounded),
                    iconSize: 35,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
