import 'package:burgerjoint/Controllers/address_controller.dart';
import 'package:burgerjoint/Models/address.dart';
import 'package:burgerjoint/Screens/checkout_screen.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../maps.dart';

class UserSavedAddress extends StatefulWidget {
  int checkToProceedToCheckOut=0;

  UserSavedAddress(this.checkToProceedToCheckOut);

  @override
  _UserSavedAddressState createState() => _UserSavedAddressState();
}


class _UserSavedAddressState extends State<UserSavedAddress> {


  List<Address> userSavedAddresses=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0,40.0,10,10.0),
                  child: userSavedAddresses.length == 0 ?Column(
                    children: [
                      SizedBox(height: 100,),
                      Center(child: Text('No address added',style:  GoogleFonts.ptSans(
                          fontSize: 16,
                          color: Colors.black
                      ),),)
                    ],
                  )    :ListView.builder(
                    shrinkWrap: true,

                    itemCount: userSavedAddresses.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: (){

                         if(widget.checkToProceedToCheckOut==1){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOut(userSavedAddresses[i].addressId,userSavedAddresses[i].zoneId,userSavedAddresses[i].address)));
                          }


                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>Maps(0.0,0.0)));
                        },
                        child: Card(
                          child: Container(
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5,),
                                Center(
                                 child: Text(userSavedAddresses[i].title,style:  GoogleFonts.ptSans(
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
                                  child: Text("Address: "+userSavedAddresses[i].address,style:  GoogleFonts.ptSans(
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
                                  child: Text("Region: "+userSavedAddresses[i].region,style:  GoogleFonts.ptSans(
                                      fontSize: 13,
                                      color: Colors.black
                                  )),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(child: Container(),),
                                      Text(userSavedAddresses[i].country,style:  GoogleFonts.ptSans(
                                          fontSize: 12,
                                          color: Colors.black
                                      )),
                                      SizedBox(width: 10,),
                                      Text(userSavedAddresses[i].city,style:  GoogleFonts.ptSans(
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
                      ) ;
                    },
                  )
                ),
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
                              'Saved Address',
                              style: GoogleFonts.ptSans(
                                  fontSize: 20,
                                  color: Colors.black
                              ),),
                          ),

                        ),
                      ],
                    )

                ),
              ],
            ),
          )
      ),
    );}

  @override
  void initState() {
    super.initState();
    // getting user addresses

    AddressController.getAddress(Global.testUrl+"addresses", Global.userToken).then((value) {
            if(value.length!=0){
            setState(() {
              userSavedAddresses=value;
            });
            }
    });



  }
}
