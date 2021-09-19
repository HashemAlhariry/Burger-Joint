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
  
  List<Order> orders=[];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child:  orders.length == 0 ?Column(
                      children: [
                        SizedBox(height: 100,),
                        Center(child: Text('No order found',style:  GoogleFonts.ptSans(
                            fontSize: 16,
                            color: Colors.black
                        ),),)
                      ],
                    )    :ListView.builder(
                      shrinkWrap: true,

                      itemCount: orders.length,
                      itemBuilder: (context, i) {

                        return
                            GestureDetector(

                            onTap: (){
                              
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Maps(0.0,0.0)));
                            },
                            child: Card(
                              child: Container(
                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Center(
                                      child: Text("",style:  GoogleFonts.ptSans(
                                          fontSize: 18,
                                          color: Colors.black
                                      ),),
                                    ),
                                    const Divider(
                                      height: 20,
                                      thickness: 2,
                                      indent: 60,
                                      endIndent: 60,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Address: " ,style:  GoogleFonts.ptSans(
                                          fontSize: 14,
                                          color: Colors.black
                                      ),),
                                    ),
                                    const Divider(
                                      height: 20,
                                      thickness: 2,
                                      indent: 60,
                                      endIndent: 60,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Region: " ,style:  GoogleFonts.ptSans(
                                          fontSize: 13,
                                          color: Colors.black
                                      )),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(child: Container(),),
                                          Text("",style:  GoogleFonts.ptSans(
                                              fontSize: 12,
                                              color: Colors.black
                                          )),
                                          SizedBox(width: 10,),
                                          Text("",style:  GoogleFonts.ptSans(
                                              fontSize: 12,
                                              color: Colors.black
                                          )),
                                        ],
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                              elevation: 8,

                              margin: EdgeInsets.all(20),
                              shape:  OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 1)
                              ),
                            ),
                          );
                      },

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
            ),
          ),
        ));
  }

  @override
  void initState() {
    OrderController.getOrders(Global.testUrl+"orders", Global.userToken).then((value){
      setState(() {
        orders=value;
      });
    });
  }
}
