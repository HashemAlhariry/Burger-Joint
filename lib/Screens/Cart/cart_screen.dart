import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {

  @override
  _CartScreenState createState() => _CartScreenState();

}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child:
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: ListView(
                children: <Widget>[
                    Container(
                     alignment: Alignment.topLeft,
                      child: Text(
                      "SHOPPING CART",
                      style:GoogleFonts.ptSans(
                        fontSize: 18,
                      ),
                ),
                margin: EdgeInsets.only(left: 12, top: 12),
            ),
               Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Total Items",
                      style: GoogleFonts.ptSans(
                        fontSize: 16,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 12, top: 4),
                  ),
               ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, position) {
                      return createCartListItem();
                    },
                    itemCount: 5,
                  ),
               Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Text(
                                "Total",
                                style: TextStyle(
                                    fontSize: 16,

                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 30),
                              child: Text(
                                "299.00 L.E",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        RaisedButton(
                          onPressed: () {

                          },
                          color: Colors.red,
                          padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(24))),
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                                fontSize: 16,

                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(height: 8,),
                      ],
                    ),
                    margin: EdgeInsets.only(top: 16),
                  )
                ],
            ),
             )
           ,

      ),
    );
  }

  createCartListItem() {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                height:80,
                width:80,
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    'https://c4.wallpaperflare.com/wallpaper/219/42/474/food-burgers-burger-wallpaper-preview.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          "BURGER FIRE",
                          maxLines: 2,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 16,

                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                     SizedBox(height: 8,),
                      Text(
                        "Medium M",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "299.00 L.E",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Icon(
                                    Icons.remove,
                                    size: 24,
                                    color: Colors.grey.shade700,
                                  ),
                                  Container(
                                    color: Colors.grey.shade200,
                                    padding: const EdgeInsets.only(
                                        bottom: 2, right: 12, left: 12),
                                    child: Text(
                                      "1",
                                      style:
                                      TextStyle(
                                          fontSize: 16,

                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 24,
                                    color: Colors.grey.shade700,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10, top: 8),
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 20,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.red),
          ),
        )
      ],
    );
  }
}

