import 'package:ecommerce/Models/address.dart';
import 'package:ecommerce/Models/city.dart';
import 'package:ecommerce/Models/country.dart';
import 'package:ecommerce/Models/user.dart';
import 'package:ecommerce/Screens/Profile/Help/TermsAndConditions/terms_and_conditions_ar.dart';
import 'package:ecommerce/Screens/Profile/Help/TermsAndConditions/terms_and_conditions_en.dart';
import 'package:ecommerce/Utils/app_localizations.dart';
import 'package:ecommerce/Utils/global.dart';
import 'package:ecommerce/Utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class ContinueSignUp extends StatefulWidget {
  User user;
  ContinueSignUp(this.user);
  @override
  _ContinueSignUpState createState() => _ContinueSignUpState();
}

class _ContinueSignUpState extends State<ContinueSignUp> {
  String regionName = '';
  String streetName = '';
  String buildingNumber = '';
  String apartmentNumber = '';

  List<Country> countriesList = [];
  List<String> countriesString = [];
  int countryIndex = -1;
  String dropdownCountry = "";

  List<City> citiesList = [];
  List<String> citiesString = [];
  int cityIndex = -1;
  String dropdownCity = "";

  bool _isButtonDisabled= false ;
  final formKeyNew = GlobalKey<FormState>();


  String language = Global.language;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,
        body: SafeArea(
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10, 0, 0),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(45.0, 5, 10, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                            child: Text(
                              "MArshelle`s",
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'marlin'),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(15.0),
                              child: Form(
                                key: formKeyNew,
                                child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Text(
                                          AppLocalizations.of(context)
                                              .translate('create_account'),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'JOSEF')),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    if (countriesList.length > 0)
                                      Container(
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          value: dropdownCountry,
                                          icon: Icon(Icons.place),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: TextStyle(color: Colors.black),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.black,
                                          ),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              citiesList = [];
                                              dropdownCountry = newValue;
                                              countryIndex = countriesString
                                                  .indexOf(newValue);
                                              City.getAllCities(
                                                      "${Global.globalUrl}/mobile/cities/" +
                                                          countriesList[
                                                                  countryIndex]
                                                              .id
                                                              .toString())
                                                  .then((value) {
                                                setState(() {
                                                  citiesString = [];
                                                  citiesList = value;
                                                  for (int i = 0;
                                                      i < citiesList.length;
                                                      i++) {
                                                    if (i == 0) {
                                                      dropdownCity =
                                                          citiesList[0]
                                                              .cityNameEn;
                                                      cityIndex = 0;
                                                    }
                                                    citiesString.add(
                                                        citiesList[i]
                                                            .cityNameEn);
                                                  }
                                                });
                                              });
                                            });
                                          },
                                          items: countriesString
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: Utils
                                                    .textStyleFunctionRegular(
                                                        15),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    if (countriesList.length > 0 &&
                                        countryIndex != -1 &&
                                        citiesList.length > 0)
                                      Container(
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          value: dropdownCity,
                                          iconSize: 24,
                                          elevation: 16,
                                          style: TextStyle(color: Colors.black),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.black,
                                          ),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownCity = newValue;
                                              cityIndex = citiesString
                                                  .indexOf(newValue);
                                            });
                                          },
                                          items: citiesString
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: Utils
                                                    .textStyleFunctionRegular(
                                                        15),
                                              ),
                                            );
                                          }).toList(),
                                        ),
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(13.0, 0, 13, 0),
                            child: submitButton(),
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
                            color: Colors.black,
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

  Widget regionField() {
    return TextFormField(
      cursorColor: Colors.grey,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: AppLocalizations.of(context).translate('region'),
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String value) {
        if (value.length < 5) {
          return "PLEASE ENTER VALID REGION";
        }
        return null;
      },
      onSaved: (String value) {
        regionName = value;
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
          labelText: AppLocalizations.of(context).translate('street_name'),
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String value) {
        if (value.length < 3) {
          return "PLEASE ENTER VALID STREET NAME";
        }
        return null;
      },
      onSaved: (String value) {
        streetName = value;
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
          labelText: AppLocalizations.of(context).translate('building_number'),
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String value) {
        if (value.length < 1) {
          return "ENTER VALID BUILDING NUMBER";
        }
        return null;
      },
      onSaved: (String value) {
        buildingNumber = value;
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
          labelText: AppLocalizations.of(context).translate('apartment_number'),
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String value) {
        if (value.length < 1) {
          return "ENTER VALID APARTMENT NUMBER";
        }
        return null;
      },
      onSaved: (String value) {
        apartmentNumber = value;
      },
    );
  }

  Widget submitButton() {

      return Container(
        height: 35,
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          color: _isButtonDisabled ? Colors.grey : Colors.black,
          child: Text(
            AppLocalizations.of(context).translate('create_account_'),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                fontFamily: 'JOSEF'),
          ),
          onPressed: () async {
            if (formKeyNew.currentState.validate()) {

              formKeyNew.currentState.save();
              setState(() {
                _isButtonDisabled=true;
              });


              User.signUp("${Global.globalUrl}/mobile/register", widget.user)
                  .then((value) {
                if (value['message'] == "user created successfully") {
                  // Navigator.of(context).popUntil((route) => route.isFirst);
                  // Navigator.popAndPushNamed(context,"");

                  Global.checkingRestart = false;

                  //save token and user data
                  Utils.toastMessage(value['message']);
                  Global.loggedInUser = widget.user;
                  Global.userToken = value['token'];


                  //save all user data
                  Global.prefs.setString('name', widget.user.name);
                  Global.prefs.setString('email', widget.user.email);
                  Global.prefs.setString('password', widget.user.password);
                  Global.prefs.setString('phone', widget.user.mobileNumber);

                  //user token
                  Global.prefs.setString('token', value['token']);


                  if (cityIndex != -1) {
                    Address address = new Address(
                        regionName,
                        streetName,
                        buildingNumber,
                        apartmentNumber,
                        countriesList[countryIndex].id,
                        citiesList[cityIndex].id);
                    print(address);
                    Address.addAddress(
                            address,
                            "${Global.globalUrl}/mobile/address/store",
                            Global.userToken,
                            widget.user.name,
                            widget.user.mobileNumber)
                        .then((value) {
                      if (value == "added successfully") {
                    //    Utils.toastMessage("ADDED SUCCESSFULLY");
                      }
                    });
                  }

                  //Utils.toastMessage("ACCOUNT CREATED SUCCESSFULLY");
                  showAlertDialog(context,language);

                } else {
                  Utils.toastMessage(
                      "The email has already been taken. please try again");
                }
              });
            }
          },
        ),
      );


  }
  showAlertDialog(BuildContext context,String language) {
    // Create button
    Widget okButton = FlatButton(
      child: Text(AppLocalizations.of(context)
          .translate('accept')),
      onPressed: () {
        RestartWidget.restartApp(context);
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Terms & Condidtion"),
      content: language=='en' ?  TermsAndConditionsEn() : TermsAndConditionsAr() ,
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  void initState() {
    Country.getAllCountries("${Global.globalUrl}/mobile/countries")
        .then((value) {
      setState(() {
        countriesString = [];
        countriesList = value;
        for (int i = 0; i < countriesList.length; i++) {
          if (i == 0) {
            dropdownCountry = countriesList[0].nameEn;
            countryIndex = 0;
          }
          countriesString.add(countriesList[i].nameEn);
        }
        City.getAllCities("${Global.globalUrl}/mobile/cities/" +
                countriesList[countryIndex].id.toString())
            .then((value) {
          setState(() {
            citiesString = [];
            citiesList = value;
            for (int i = 0; i < citiesList.length; i++) {
              if (i == 0) {
                dropdownCity = citiesList[0].cityNameEn;
                cityIndex = 0;
              }
              citiesString.add(citiesList[i].cityNameEn);
            }
          });
        });
      });
    });
  }
}
