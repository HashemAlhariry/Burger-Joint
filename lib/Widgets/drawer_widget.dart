import 'package:burgerjoint/Models/user.dart';
import 'package:burgerjoint/Screens/Cart/cart_screen.dart';
import 'package:burgerjoint/Screens/Profile/Addresses/user_saved_address.dart';
import 'package:burgerjoint/Screens/Profile/proflie.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:burgerjoint/Providers/user_provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   User user = provider.Provider.of<UserProvider>(context, listen: true).user;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              icon: const Icon(
                Icons.clear,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          // ignore: sized_box_for_whitespace
          Container(
            height: user.userName!="" ? 500 : 415,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if(user.userName=="" && Global.loggedInUser.name==""){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => Profile(),
                            ),
                          );
                        }

                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_circle_sharp,
                              size: 28,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              child: Text(
                                (user.userName=="") ? 'Login' : "Welcome " + user.userName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'JOSEF'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    h8(),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              size: 28,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              child: Text(
                                'Cart',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'JOSEF'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    h8(),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 28,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              child: Text(
                                'Track Orders',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'JOSEF'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    h8(),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.history,
                              size: 28,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              child: Text(
                                'Your Orders',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'JOSEF'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    h8(),
                    if(user.userName!="")
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserSavedAddress(0)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_location_sharp,
                              size: 28,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              child: Text(
                                'Addresses',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'JOSEF'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    h8(),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.house_outlined,
                              size: 28,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              child: Text(
                                'Our Branches',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'JOSEF'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    h8(),
                    InkWell(
                      onTap: () {

                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.rate_review,
                              size: 28,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              child: Text(
                                'Rate Us',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'JOSEF'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    h8(),
                    InkWell(
                      onTap: () {

                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.help,
                              size: 28,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              child: Text(
                                'Help',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'JOSEF'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    h8(),
                    if(user.userName!="")
                    InkWell(
                      onTap: () {
                        User user = new User.loggedIn("","","","",0);
                        provider.Provider.of<UserProvider>(context, listen: false).userLoggedIn(user);
                        Global.loggedInUser=user;
                        },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              size: 28,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              child: Text(
                               "Log Out",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'JOSEF'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox h8() => const SizedBox(height: 8,);
}
