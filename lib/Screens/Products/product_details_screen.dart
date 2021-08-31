import 'package:burgerjoint/Models/product.dart';
import 'package:burgerjoint/Widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatefulWidget {

  final Product product;
  const ProductDetailsScreen({
    Key? key,
    required this.product
  }) : super(key: key);
  
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();

}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {


  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    extraBoolList =  List<bool>.generate(widget.product.extras.length, (i) => false);
  }
  //for extras items
  late List<bool> extraBoolList;


  bool expanded=false;

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
                                  widget.product.productTitle,
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
                        tag: widget.product.productId,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .3,
                          // width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Image.network(
                              widget.product.productImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          widget.product.productDescription,
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


                      /*
                    //EXTRAS
                      if (widget.product.extras.length>1)
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                        child: Text('Extras',style:GoogleFonts.ptSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),),

                   ...List.generate(
                        widget.product.extras.length,
                            (i) =>       Container(
                          color: Colors.white,
                          padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(child: Text( widget.product.extras[i].productName,style:GoogleFonts.ptSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),),
                              Expanded(child: Container()),
                              Container(child: Text(widget.product.extras[i].sizePrice.toString(),style:GoogleFonts.ptSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),),
                              Checkbox(
                                value: extraBoolList[i],
                                activeColor: Colors.red,
                                onChanged: (bool? value) {
                                  setState(() {
                                    this.extraBoolList[i] = value! ;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),),

                      */
                      ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return ExpansionPanelList(
                            animationDuration: Duration(milliseconds: 300),
                            dividerColor: Colors.red,
                            elevation: 1,
                            children: [
                              ExpansionPanel(
                                body: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: List.generate(
                                      widget.product.extras.length,
                                          (i) =>       Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(child: Text( widget.product.extras[i].productName,style:GoogleFonts.ptSans(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),),),
                                            Expanded(child: Container()),
                                            Container(child: Text(widget.product.extras[i].sizePrice.toString(),style:GoogleFonts.ptSans(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),),),
                                            Checkbox(
                                              value: extraBoolList[i],
                                              activeColor: Colors.red,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  this.extraBoolList[i] = value! ;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),),
                                  ),
                                ),
                                headerBuilder: (BuildContext context, bool isExpanded) {
                                  return Container(
                                      padding: EdgeInsets.all(10),
                                    child: Text('Extras',style:GoogleFonts.ptSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),)
                                  );
                                },
                                isExpanded: expanded,
                              )
                            ],
                            expansionCallback: (int item, bool status) {
                              setState(() {
                                expanded = !expanded;
                              });
                            },
                          );
                        },
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


