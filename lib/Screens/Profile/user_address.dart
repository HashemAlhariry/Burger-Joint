
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class UserAddress extends StatefulWidget {
  @override
  _UserAddressState createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {

  String country = '';
  String city = '';
  String titleName = '';
  String regionName = '';
  String streetName = '';
  String buildingNumber = '';
  String apartmentNumber = '';
  bool _isButtonDisabled = false;
  final formKeyNew = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(45.0, 0, 0, 0),
                            child:Text(
                              'Address',
                              style: GoogleFonts.ptSans(
                                  fontSize: 25,
                                  color: Colors.black
                              ),),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(15.0),
                              child: Form(
                                key: formKeyNew,
                                child: ListView(
                                  children: [
                                    titleNameField(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: countryField()),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(child: cityField())
                                      ],
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    streetNameField(),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: buildingNumberField()),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(child: apartmentNumberField())
                                      ],
                                    ),
                                    RaisedButton(onPressed: (){}, child:Text(
                                      'Choose from saved addresses',
                                      style: GoogleFonts.ptSans(
                                          fontSize: 20,
                                          color: Colors.black
                                      ),),)
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(13.0, 0, 13, 0),
                            child: addAddress(),
                          ),
                        ],
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: new Icon(
                            Icons.arrow_back_ios_outlined,
                            color:  Color(0xffED1C24),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }

  Widget countryField() {
    return TextFormField(
      cursorColor: Colors.grey,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: 'Country Name',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String? value) {
        if (value!.length < 3) {
          return "Enter a valid country name";
        }

      },
      onSaved: (String? value) {
        country = value!;
      },
    );
  }
  Widget cityField() {
    return TextFormField(
      cursorColor: Colors.grey,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: 'City Name',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String? value) {
        if (value!.length < 3) {
          return "Enter valid city name";
        }

      },
      onSaved: (String? value) {
        city = value!;
      },
    );
  }
  Widget titleNameField() {
    return TextFormField(
      cursorColor: Colors.grey,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: 'Title Name',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String? value) {
        if (value!.length < 3) {
          return "Enter a valid title name";
        }

      },
      onSaved: (String? value) {
        streetName = value!;
      },
    );
  }
  Widget streetNameField() {
    return TextFormField(
      cursorColor: Colors.grey,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: 'Street Name',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String? value) {
        if (value!.length < 3) {
          return "Enter valid street name";
        }

      },
      onSaved: (String? value) {
        streetName = value!;
      },
    );
  }
  Widget buildingNumberField() {
    return TextFormField(
      cursorColor: Colors.grey,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: 'Building Number',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String? value) {
        if (value!.length < 1) {
          return "Enter valid building number";
        }

      },
      onSaved: (String? value) {
        buildingNumber = value!;
      },
    );
  }
  Widget apartmentNumberField() {
    return TextFormField(
      cursorColor: Colors.grey,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText:'Apartment Number',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String? value) {
        if (value!.length < 1) {
          return "Enter valid apartment number";
        }

      },
      onSaved: (String? value) {
        apartmentNumber = value!;
      },
    );
  }
  Widget addAddress() {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        color: _isButtonDisabled ? Colors.grey : Colors.red,
        child: Text(
          'Add Address',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14,
              fontFamily: 'JOSEF'),
        ),
        onPressed: () async {
          if (formKeyNew.currentState!.validate()) {
            formKeyNew.currentState!.save();
            setState(() {
              _isButtonDisabled = true;
            });
          }
        },
      ),
    );
  }

  @override
  void initState() {
    //get all user saved location
  }
}
