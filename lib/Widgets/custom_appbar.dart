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
        child: Container(
          color: _colorFromHex(backgroundColor),
          child: Row(
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
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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
