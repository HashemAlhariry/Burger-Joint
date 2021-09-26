import 'package:burgerjoint/Screens/Cart/cart_screen.dart';
import 'package:flutter/material.dart';
import '../Utils/global.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {


  final String title;
  final Color backgroundColor;
  final ValueChanged<bool> onChanged;
  final String branchName;
  final ValueChanged<String> searchedItems;

  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.backgroundColor,
      required this.onChanged,
      required this.branchName,
      required this.searchedItems
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color:backgroundColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0.0,0.0,0.0),
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
                              branchName,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                      onChanged: (text){
                         //get text and update items in homepage Category
                        if(text.length==0){

                          searchedItems('');

                        }else{
                          searchedItems(text);
                        }


                      },
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
                  Expanded(child: Container()),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));

                    },
                    icon: Icon(Icons.shopping_cart_rounded),
                    iconSize: 20,
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
