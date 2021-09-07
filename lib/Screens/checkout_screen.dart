import 'package:burgerjoint/Models/address.dart';
import 'package:burgerjoint/Models/cart.dart';
import 'package:burgerjoint/Models/user.dart';
import 'package:burgerjoint/Providers/cart_provider.dart';
import 'package:burgerjoint/Providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart' as provider;
class CheckOut extends StatefulWidget {

  int addressId;
  int zoneId;
  CheckOut(this.addressId,this.zoneId);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  // cart provider
  late Cart cart;

  // user provide
  late User user;

  @override
  Widget build(BuildContext context) {

    cart = provider.Provider.of<CartProvider>(context, listen: true).cart;
    user =  provider.Provider.of<UserProvider>(context, listen: true).user;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              if(cart.cartItems.length>0)
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
                                    Row(
                                      children: [
                                        Text(
                                          cart.cartItems[i].productSizes[0].sizeName,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Expanded(child:Container()),
                                        if( cart.cartItems[i].comboProducts.length>0)
                                          Text(
                                            cart.cartItems[i].comboProducts[0].sizeName,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 8,),

                                    if(  cart.cartItems[i].extras.length>0)
                                      ...List.generate(
                                        cart.cartItems[i].extras.length,
                                            (index) =>     Container(
                                          color: Colors.white,
                                          padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              if(index==0)
                                                Container(child: Text( "Extras: ",style:GoogleFonts.ptSans(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                ),),),
                                              Container(child: Text( cart.cartItems[i].extras[index].productName,style:GoogleFonts.ptSans(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                              ),),),



                                            ],
                                          ),
                                        ),),
                                    SizedBox(height: 5,),
                                    if(  cart.cartItems[i].productSizes[0].withOuts.length>0)
                                      ...List.generate(
                                        cart.cartItems[i].productSizes[0].withOuts.length,
                                            (index) =>     Container(
                                          color: Colors.white,
                                          padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              if(index==0)
                                                Container(child: Text( "Without: ",style:GoogleFonts.ptSans(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                ),),),
                                              Container(child: Text( cart.cartItems[i].productSizes[0].withOuts[index].name,style:GoogleFonts.ptSans(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                              ),),),



                                            ],
                                          ),
                                        ),),
                                    SizedBox(height: 8,),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            ( cart.cartItems[i].totalProductPrice* cart.cartItems[i].quantity ).toString() ,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            " EGP" ,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Expanded(child: Container()),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: <Widget>[
                                                InkWell(
                                                  onTap:(){
                                                    if( cart.cartItems[i].quantity>1){
                                                      setState(() {
                                                        cart.cartItems[i].quantity--;
                                                        provider.Provider.of<CartProvider>(context, listen: false).totalPrice-= cart.cartItems[i].totalProductPrice;
                                                      });
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    size: 24,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.grey.shade200,
                                                  padding: const EdgeInsets.only(
                                                      bottom: 2, right: 12, left: 12),
                                                  child: Text(
                                                    cart.cartItems[i].quantity.toString(),
                                                    style:
                                                    TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      cart.cartItems[i].quantity++;
                                                      provider.Provider.of<CartProvider>(context, listen: false).totalPrice+= cart.cartItems[i].totalProductPrice;
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 24,
                                                    color: Colors.grey.shade700,
                                                  ),
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
              )
            ],
          ),

        ),
      ),
    );
  }
}
