import 'package:burgerjoint/Screens/Cart/cart_main_screen.dart';
import 'package:flutter/material.dart';

import '../Utils/global.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String backgroundColor;
  final ValueChanged<bool> onChanged;
  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.backgroundColor,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: _colorFromHex(backgroundColor),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // THIS ON CHANGED CALL BACK TO CHECK MENU PRESSED
                      onChanged(true);
                    }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                          Text(
                            ' NASR CITY, MOKATTAM',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CartMainScreen()));

                    },
                    icon: Icon(Icons.shopping_cart_rounded),
                    iconSize: 35,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  @override
  Size get preferredSize => Size.fromHeight(Global.appBarSize);
}
