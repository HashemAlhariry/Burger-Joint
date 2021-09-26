import 'package:burgerjoint/Controllers/order_controller.dart';
import 'package:burgerjoint/Models/order.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderHistory extends StatefulWidget {

  @override
  _OrderHistoryState createState() => _OrderHistoryState();

}

class _OrderHistoryState extends State<OrderHistory> {


  List<Order> orders = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Global.scaffoldBackGroundColor,
        body: SafeArea(
          child: Stack(
            children: [
          Padding(
            padding: EdgeInsets.all(10),
            child:orders.length == 0 ?
          Column(
            children: [
              SizedBox(height: 100,),
              Center( child: Text('No order found',style:  GoogleFonts.ptSans(
                  fontSize: 16,
                  color: Colors.black),),)
            ],
          ) : ListView(
            children:[
              SizedBox(height:40,),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Padding(
                                  padding:EdgeInsets.all(5),
                                  child: Text("Order Id:" ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
                              Padding(
                                  padding:EdgeInsets.all(5),
                                  child: Text(orders[index].orderId ,style: TextStyle(fontSize: 12),)),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Padding(
                                padding:EdgeInsets.all(5),
                                child: Text("Payment Method:" ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),

                              Padding(
                                  padding:EdgeInsets.all(5),
                                  child: Text(orders[index].paymentMethodForHistory,style: TextStyle(fontSize: 12),)),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text("Delivery Fees: " ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
                              Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(orders[index].deliveryFees.toString(),style: TextStyle(fontSize: 12),)),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  " EGP" ,
                                  style: TextStyle(
                                      fontSize: 12  ,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text("Total: " ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
                              Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text( (orders[index].totalAfter+orders[index].deliveryFees).toString(),style: TextStyle(fontSize: 15),)),


                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  " EGP" ,
                                  style: TextStyle(
                                      fontSize: 12  ,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),

                            ],
                          ),

                          Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text("Order Status:" ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
                              Expanded(child: Container()),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  orders[index].orderStatus ,
                                  style: TextStyle(
                                      fontSize: 12  ,
                                      color:  Colors.green ,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),

                            ],
                          ),
                          Card(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount:orders[index].products.length,
                              itemBuilder: (context,i){
                                return  Container(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Row(
                                        children: [
                                          Container(
                                          child: Text(orders[index].products[i].productTitle,
                                            maxLines: 2,
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),

                                          Expanded(child: Container()),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text("x"+orders[index].products[i].quantity.toString()+"  " ,style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w300)),
                                                Text(
                                                    orders[index].products[i].totalProductPrice.toString() ,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(width: 5,),
                                                Text(
                                                  " EGP" ,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w400),
                                                ),


                                              ],
                                            ),
                                          ),],
                                      ),
                                      SizedBox(height: 5,),
                                      if(  orders[index].products[i].comboProducts.length>0)
                                      Row(

                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                                            child: Text("COMBO: ",style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            orders[index].products[i].comboProducts[0].sizeName.toString() ,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          Expanded(child: Container()),

                                          Text("x"+orders[index].products[i].quantity.toString()+"  " ,style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300)),

                                          Text(
                                            orders[index].products[i].comboProducts[0].price.toString() ,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            " EGP" ,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),

                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      if( orders[index].products[i].extras.length>0)
                                      ...List.generate(
                                          orders[index].products[i].extras.length,
                                              (j) =>     Container(
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
                                                Row(
                                                  children: [
                                                    Container(child: Text(  orders[index].products[i].extras[j].productName,style:GoogleFonts.ptSans(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 8,
                                                    ),),),
                                                    Container(child: Text(  "  "+ orders[index].products[i].extras[j].sizePrice.toString() ,style:GoogleFonts.ptSans(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 10,
                                                    ),),),
                                                    Container(child: Text(   " EGP",style:GoogleFonts.ptSans(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 10,
                                                    ),),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),),



                                    ],
                                  ),
                                );
                              },),

                          ),
                          SizedBox(height: 30,),
                          if(orders.length-1!=index)
                          Divider(
                            height: 1,
                            thickness: 1,
                            indent: 40,
                            endIndent: 40,
                          ),
                          SizedBox(height: 20,),

                        ],
                      ),
                    ),
                  );
                },
              )
            ]
          ),),
              Container(
                color: Colors.grey.shade50,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: new Icon(
                              Icons.arrow_back_ios_outlined,
                              color:  Color(0xffED1C24),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        )

                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 0),
                        child:Text(
                          'Your Last Orders',
                          style: GoogleFonts.ptSans(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),),
                      ),

                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void initState() {
    OrderController.getOrders(Global.testUrl+"orders", Global.userToken).then((value){
      setState(() {
        orders=value;
        print(orders);
      });
    });
  }
}
