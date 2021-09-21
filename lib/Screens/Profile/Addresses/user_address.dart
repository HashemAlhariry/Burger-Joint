import 'package:burgerjoint/Controllers/address_controller.dart';
import 'package:burgerjoint/Models/address.dart';
import 'package:burgerjoint/Screens/Profile/Addresses/user_saved_address.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_fonts/google_fonts.dart';
import '../../checkout_screen.dart';


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
  String floorNumber = '';
  bool _isButtonDisabled = false;

  var countryController = TextEditingController();
  var cityController = TextEditingController();
  var regionController = TextEditingController();
  var streetNameController = TextEditingController();


  final formKeyNew = GlobalKey<FormState>();
  late Position userLocation = new Position(longitude: 0,
      latitude: 0,
      accuracy: 0.0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0,
      timestamp: null);

  bool getLocationPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Global.scaffoldBackGroundColor,
        body: SafeArea(
          child: Container(
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
                            child: Text(
                              'ADDRESS',
                              style: GoogleFonts.ptSans(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
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
                                    regionField(),
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
                                    SizedBox(
                                      height: 7,
                                    ),
                                    floorNumberField(),
                                    SizedBox(
                                        height: 30
                                    ),

                                    ElevatedButton(

                                      child: Text(
                                        'Saved Addresses',
                                        style: TextStyle(fontSize: 12),),
                                      onPressed: () =>  Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserSavedAddress(1))),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        onPrimary: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(0.0),
                                        ),
                                      ),
                                    )

                                    /*
                                        RaisedButton(
                                    onPressed: (){

                                    },
                                      color: Colors.red,
                                      child:Text(
                                      'Choose from saved addresses',
                                      style: GoogleFonts.ptSans(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),),)
                                     */

                                  ],
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(13.0, 0, 13, 0),
                            child: Row(
                              children: [

                                Expanded(child: addAddress()),
                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: () {
                                    determinePosition();
                                  },
                                  child: Icon(
                                    Icons.gps_fixed,
                                    color: !getLocationPressed
                                        ? Colors.grey
                                        : Colors.blue,
                                  ),),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Color(0xffED1C24),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),

                  ],
                )),
          ),
        ));
  }

  Widget countryField() {
    return TextFormField(
      controller: countryController,
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
      controller: cityController,
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
          labelText: 'Address Title',
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
        titleName = value!;
      },
    );
  }

  Widget streetNameField() {
    return TextFormField(
      controller: streetNameController,
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
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: 'Apartment Number',
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

  Widget floorNumberField() {
    return TextFormField(
      cursorColor: Colors.grey,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: 'Floor Number',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String? value) {
        if (value!.length < 1) {
          return "Enter valid floor number";
        }
      },
      onSaved: (String? value) {
        floorNumber = value!;
      },
    );
  }

  Widget regionField() {
    return TextFormField(
      controller: regionController,
      cursorColor: Colors.grey,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: 'Region',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String? value) {
        if (value!.length < 1) {
          return "Enter valid region";
        }
      },
      onSaved: (String? value) {
        regionName = value!;
      },
    );
  }

  Widget addAddress() {
    return Container(
      height: 35,
      width: MediaQuery
          .of(context)
          .size
          .width,
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
          if (!_isButtonDisabled) {
            if (formKeyNew.currentState!.validate()) {
              formKeyNew.currentState!.save();
              setState(() {
                //_isButtonDisabled = true;
              });

              String userAddress = buildingNumber + ", " + streetName + ", " +
                    regionName + ", " + city + ", " + country;



              if( userLocation.latitude!=0){

                Address address = new Address(
                    titleName,
                    Global.branch.branchId,
                    country,
                    city,
                    0,
                    regionName,
                    userAddress,
                    buildingNumber,
                    apartmentNumber,
                    floorNumber,
                    "",
                    0,
                    userLocation.latitude,
                    userLocation.longitude);

                AddressController.addAddress(address,
                    Global.testUrl + "addresses",
                    Global.userToken).then((value) {
                  //send user to check out
                  // with cart details
                  if (value['address'] != "") {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            CheckOut(value['id'], value['zone_id'],
                                value['address'],value['latitude'],value['longitude'])));
                  }
                  else {

                  }
                });


              }else{
                Global.toastMessage("Please enable location");
              }

            }
          }
        },
      ),
    );
  }

  // When the location services are not enabled or permissions are denied the Future will return an error
  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Global.toastMessage('Location services are disabled.') ;
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Global.toastMessage('Location permissions are denied') ;
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Global.toastMessage('Location permissions are permanently denied, we cannot request permissions.') ;
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    try{
      Position position = await Geolocator.getCurrentPosition();
      userLocation = position;
      List<Placemark> placeMarks = await placemarkFromCoordinates(
          userLocation.latitude,userLocation.longitude);

      setState(() {
        countryController.text = placeMarks[0].country ?? "";
        streetNameController.text = placeMarks[0].street ?? "";
        cityController.text = placeMarks[0].administrativeArea ?? "";
        regionController.text = placeMarks[0].subAdministrativeArea ?? "";
        getLocationPressed = true;
      });
    }catch(Exception){
      Global.toastMessage('Error occured while getting location') ;
    }

  }


  void disposeControllers() {
    countryController.dispose();
    cityController.dispose();
    regionController.dispose();
    streetNameController.dispose();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    determinePosition();
  }


}