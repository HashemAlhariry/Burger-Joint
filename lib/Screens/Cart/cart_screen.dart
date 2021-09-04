import 'package:burgerjoint/Models/cart.dart';
import 'package:burgerjoint/Providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart' as provider;

class CartScreen extends StatefulWidget {

  @override
  _CartScreenState createState() => _CartScreenState();

}

class _CartScreenState extends State<CartScreen> {

  // cart provider
  late Cart cart;

  @override
  Widget build(BuildContext context) {

    cart = provider.Provider.of<CartProvider>(context, listen: true).cart;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: <Widget>[
                  Row(
                    children: [
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
                      Expanded(child: Container(),),
                      GestureDetector(
                        onTap: (){
                          provider.Provider.of<CartProvider>(context, listen: false).deleteCart();
                          provider.Provider.of<CartProvider>(context, listen: false).totalPrice=0;
                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "DELETE CART",
                            style:TextStyle(fontSize: 14),
                          ),
                          margin: EdgeInsets.only(left: 12, top: 12),
                        ),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Total Items " + cart.cartItems.length.toString(),
                      style: GoogleFonts.ptSans(
                        fontSize: 16,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 12, top: 4),
                  ),
                  cart.cartItems.length>0 ?
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,

                    itemCount: cart.cartItems.length,
                    itemBuilder: (context, i) {
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
                                      cart.cartItems[i].productImage,
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
                                            cart.cartItems[i].productTitle,
                                            maxLines: 2,
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(height: 8,),
                                        Text(
                                          cart.cartItems[i].productSizes[0].sizeName,
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
                                                cart.cartItems[i].totalProductPrice.toString(),
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
                            child: GestureDetector(
                              onTap:(){

                                provider.Provider.of<CartProvider>(context, listen: false).deleteCartItem(i);

                              },
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
                            ),
                          )
                        ],
                      );
                    },
                  ) :
                  Column(
                    children: [
                      SizedBox(height: 200,),
                      Center(child: Text(
                        "Your Cart Is Empty",
                        style:GoogleFonts.ptSans(
                          fontSize: 18,
                        ),
                      ),),
                    ],
                  ),
                  SizedBox(height: 50,)

                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Expanded(child: Container(),),
                  Container(

                    child:   Row(


                    children: <Widget>[


                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
                            child: Text("TOTAL  "+    provider.Provider.of<CartProvider>(context, listen: true).totalPrice.toString()+" EGP",style:  GoogleFonts.bebasNeue(

                              fontSize: 25,
                            ),),
                          )
                       ,
                      Expanded(child: Container(),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
                        child: FlatButton(color:Colors.red,
                            onPressed: (){

                            },
                            child: Container(
                              width: 150,
                              child: Center(child: Text("Check out",style: TextStyle(color: Colors.white,fontSize: 18),)),
                            )),
                      ),
                      SizedBox(height: 8,),
                    ],
                  ),color: Colors.white,)

                ],
              )

            )
          ],
        )
      ),
    );

  }


}

/*


 */