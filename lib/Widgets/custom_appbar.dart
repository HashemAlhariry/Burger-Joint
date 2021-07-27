import 'package:flutter/material.dart';


class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{

  final String title;
  final Color backgroundColor;

  const CustomAppBar({Key? key, required this.title,required this.backgroundColor}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  Size get preferredSize => Size.fromHeight(100.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.red,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(icon: Icon(Icons.menu,color: Colors.white,), onPressed: () {print('hey');}),
            Padding(

              padding: const EdgeInsets.fromLTRB(0,12,0,0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                      Text(
                        'NASR CITY, MOKATTAM',
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      )
                    ],
                  ),


                ],
              ),
            ),

          ],
        ),
      ),

    );
  }

}


