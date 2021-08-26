import 'package:burgerjoint/Widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatefulWidget {

  late final String imageUrl;
  late final String title;
  late final String description;
  late final double price;
  late final int id;


  ProductDetailsScreen(
      this.imageUrl, this.title, this.description, this.price, this.id);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {


  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();


  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Stack(
            children : [
              Padding(
                padding:  EdgeInsets.all(0.0),
                child: ListView(

                    children: [
                      SizedBox(height: 20,),
                      Row(
                        children: [

                          Expanded(
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  widget.title,
                                  style: GoogleFonts.bebasNeue(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50,
                                    color: Color(0xffF80009),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Hero(
                        tag: widget.id,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .3,
                          // width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Image.network(
                              widget.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          widget.description,
                          style: GoogleFonts.ptSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Color(0xff5B5B5B),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .15,
                          width: MediaQuery.of(context).size.width * .7,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                100,
                              ),
                            ),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .05,
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * .06,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF80009),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          20,
                                        ),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child:  Text(
                                      "SINGLE",
                                      style: GoogleFonts.ptSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * .05,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF80009),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          50,
                                        ),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "DOUBLE",
                                      style: GoogleFonts.ptSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                        child: Text('Size',style:GoogleFonts.ptSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),),
                      // LIST OF ALL SIZES AVAILABLE
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: Text('Regular',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Expanded(child: Container()),
                            Container(child: Text('10 L.E',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Radio(
                              value: 1,
                              groupValue: val,
                              onChanged: (value) {

                                val = value as int;
                                print(value);
                                print(val);
                              },
                              activeColor: Colors.red,
                            ),


                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: Text('Regular',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Expanded(child: Container()),
                            Container(child: Text('10 L.E',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Radio(
                              value: 1,
                              groupValue: val,
                              onChanged: (value) {

                                val = value as int;
                                print(value);
                                print(val);

                              },
                              activeColor: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: Text('Regular',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Expanded(child: Container()),
                            Container(child: Text('10 L.E',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Radio(
                              value: 1,
                              groupValue: val,
                              onChanged: (value) {

                                val = value as int;
                                print(value);
                                print(val);
                              },
                              activeColor: Colors.red,
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                        child: Text('Extras',style:GoogleFonts.ptSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),),

                      // LIST OF ALL SIZES AVAILABLE
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: Text('Fries',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Expanded(child: Container()),
                            Container(child: Text('10 L.E',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Radio(
                              value: 1,
                              groupValue: val,
                              onChanged: (value) {

                                val = value as int;
                                print(value);
                                print(val);
                              },
                              activeColor: Colors.red,
                            ),


                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: Text('Fries',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Expanded(child: Container()),
                            Container(child: Text('10 L.E',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Radio(
                              value: 1,
                              groupValue: val,
                              onChanged: (value) {

                                val = value as int;
                                print(value);
                                print(val);
                              },
                              activeColor: Colors.red,
                            ),


                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: Text('Fries',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Expanded(child: Container()),
                            Container(child: Text('10 L.E',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Radio(
                              value: 1,
                              groupValue: val,
                              onChanged: (value) {

                                val = value as int;
                                print(value);
                                print(val);
                              },
                              activeColor: Colors.red,
                            ),


                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                        child: Text('Adds',style:GoogleFonts.ptSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),),

                      // LIST OF ALL SIZES AVAILABLE
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: Text('Regular',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Expanded(child: Container()),
                            Container(child: Text('10 L.E',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Radio(
                              value: 1,
                              groupValue: val,
                              onChanged: (value) {

                                val = value as int;
                                print(value);
                                print(val);
                              },
                              activeColor: Colors.red,
                            ),


                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: Text('Regular',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Expanded(child: Container()),
                            Container(child: Text('10 L.E',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Radio(
                              value: 1,
                              groupValue: val,
                              onChanged: (value) {

                                val = value as int;
                                print(value);
                                print(val);
                              },
                              activeColor: Colors.red,
                            ),

                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: Text('Regular',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Expanded(child: Container()),
                            Container(child: Text('10 L.E',style:GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),),
                            Radio(
                              value: 1,
                              groupValue: val,
                              onChanged: (value) {

                                val = value as int;
                                print(value);
                                print(val);
                              },
                              activeColor: Colors.red,
                            ),


                          ],
                        ),
                      ),

                    ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Color(0xffED1C24),
                  iconSize: 26,
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
              ),
            ]

        ),
      ),
    );
  }
}



