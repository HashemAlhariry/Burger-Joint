import 'package:burgerjoint/Controllers/order_controller.dart';
import 'package:burgerjoint/Models/address.dart';
import 'package:burgerjoint/Models/cart.dart';
import 'package:burgerjoint/Models/order.dart';
import 'package:burgerjoint/Models/user.dart';
import 'package:burgerjoint/Providers/cart_provider.dart';
import 'package:burgerjoint/Providers/user_provider.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart' as provider;

import 'maps.dart';
class CheckOut extends StatefulWidget {

  int addressId;
  int zoneId;
  String addressName;
  double lat;
  double lon;
  CheckOut(this.addressId,this.zoneId,this.addressName,this.lat,this.lon);

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

    String comment="";
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 10, 10),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(30.0,0,10.0,0),
                    margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text('Delivery To',style:  GoogleFonts.bebasNeue(
                      fontSize: 25,
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 40,
                    endIndent: 40,
                  ),
                   SizedBox(height: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    width:MediaQuery.of(context).size.width*0.5,
                    child: Maps(widget.lat,widget.lon),
                  ),
                  SizedBox(height: 10,),
                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 40,
                    endIndent: 40,
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.fromLTRB(0,0,0.0,0),
                    margin: EdgeInsets.only(left: 0, right: 0, top: 10),
                    child: Text('Items',style:  GoogleFonts.bebasNeue(
                      fontSize: 25,
                    ),),
                  ),
                  SizedBox(height: 10,),
                   Divider(
                    height: 1,
                    thickness: 1,
                    indent: 40,
                    endIndent: 40,
                  ),
                   SizedBox(height: 10,),
                  if(cart.cartItems.length>0)
                    Container(
                      height:MediaQuery.of(context).size.height*0.25,
                      width:MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: cart.cartItems.length,
                        itemBuilder: (context, i) {
                          return Container(

                            width:MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(16))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height:60,
                                  width:60,
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
                                    padding: const EdgeInsets.all(5.0),
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
                                                fontSize: 12,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(height: 3,),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                cart.cartItems[i].productSizes[0].sizeName,
                                                style: TextStyle(
                                                    fontSize: 12,
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
                                        ),
                                        SizedBox(height: 3,),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                ( cart.cartItems[i].totalProductPrice* cart.cartItems[i].quantity ).toString() ,
                                                style: TextStyle(
                                                    fontSize: 12,
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

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
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

                                  ],
                                )

                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  SizedBox(height: 10,),
                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 40,
                    endIndent: 40,
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        child: Text('Address : ',style:  GoogleFonts.bebasNeue(
                        fontSize: 16,
                        )),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Text(widget.addressName,style:  TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        child: Text('Subtotal : ',style:  GoogleFonts.bebasNeue(
                          fontSize: 16,
                        )),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text( provider.Provider.of<CartProvider>(context, listen: true).totalPrice.toString()+" EGP",style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        child: Text('Delivery Fees :',style:  GoogleFonts.bebasNeue(
                          fontSize: 16,
                        )),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text("0",style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        child: Text('Total :',style:  GoogleFonts.bebasNeue(
                          fontSize: 16,
                        )),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(provider.Provider.of<CartProvider>(context, listen: true).totalPrice.toString(),style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                ],
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                 Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: new Icon(
                          Icons.arrow_back_ios_outlined,
                          color:  Color(0xffED1C24),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),

                  Expanded(child:Container()),
                  Container(
                    padding:EdgeInsets.fromLTRB(20, 0,20, 0),
                    height: 35,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                    color:  Colors.red,
                       child: Text(
                        'Place Order', style: TextStyle(
                       color: Colors.white,
                     fontWeight: FontWeight.w700,
                    fontSize: 14,
                    fontFamily: 'JOSEF'),
                       ),
                    onPressed: () async {

                      Order  order = new Order(
                          Global.branch.branchId,
                          provider.Provider.of<CartProvider>(context, listen: false).totalPrice,
                          provider.Provider.of<CartProvider>(context, listen: false).totalPrice,
                          cart.cartItems,
                          [],
                          3,
                          3,
                          "",
                          0,
                          comment,
                          false,widget.addressId);
                      OrderController.storeOrder(Global.testUrl+"orders", order, comment, Global.userToken).then((value){
                        //send message to user
                        //update screen for order created
                        if(value['message']!=null){
                          Global.toastMessage(value['message']);
                        }else{
                          Global.toastMessage("Order not created");
                        }
                      });

                    },
                  ),
               )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
