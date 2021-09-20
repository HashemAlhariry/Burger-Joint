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
        body: SafeArea(
          child: Stack(
            children: [
          Padding(
            padding: EdgeInsets.all(10),
            child:orders.length == 0 ?
          Column(
            children: [
              SizedBox(height: 100,),
              Center(child: Text('No order found',style:  GoogleFonts.ptSans(
                  fontSize: 16,
                  color: Colors.black
              ),),)
            ],
          ) : ListView(
            children:[
              SizedBox(height:50 ,),
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0,5.0,10.0,5.0),
                            child: Center(child: Text(  orders[index].branchName,style: TextStyle(fontSize: 20),)),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0,5.0,10.0,5.0),
                            child: Text("Payment Method: "+orders[index].paymentMethodForHistory,style: TextStyle(fontSize: 12),)),
                          SizedBox(height: 5,),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(10.0,5.0,10.0,5.0),
                              child: Text("Delivery Fees: "+orders[index].deliveryFees.toString(),style: TextStyle(fontSize: 12),)),
                          SizedBox(height: 5,),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(10.0,5.0,10.0,5.0),
                              child: Text("Total: " +orders[index].totalAfter.toString(),style: TextStyle(fontSize: 15),)),
                          Card(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount:orders[index].products.length,
                              itemBuilder: (context,i){
                                return  Container(
                                  padding: const EdgeInsets.all(8.0),
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
                                                Text(
                                                  (  orders[index].products[i].totalProductPrice ).toString() ,
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


                                              ],
                                            ),
                                          ),],
                                      ),
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
                                                Container(child: Text(  orders[index].products[i].extras[j].productName,style:GoogleFonts.ptSans(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 8,
                                                ),),),
                                              ],
                                            ),
                                          ),),



                                    ],
                                  ),
                                );
                              },),

                          ),

                          SizedBox(height: 5,),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(10.0,5.0,10.0,5.0),
                              child: Text("Payment Method: "+orders[index].paymentMethodForHistory,style: TextStyle(fontSize: 12),)),
                          SizedBox(height: 50,),
                        ],
                      ),
                    ),
                  );
                },
              )
            ]
          ),),





              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10, 0, 0),
                          child:Text(
                            'Orders',
                            style: GoogleFonts.ptSans(
                                fontSize: 22,
                                color: Colors.black
                            ),),
                        ),

                      ),
                    ],
                  )

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
