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
                onPressed: () {
                  Navigator.pop(context);
                },
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
                    title,
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
          Hero(
            tag: id,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              // width: MediaQuery.of(context).size.width,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              description,
              style: GoogleFonts.ptSans(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Color(0xff5B5B5B),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffF8F8F8),
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    50,
                  ),
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .05,
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF80009)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          50,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
