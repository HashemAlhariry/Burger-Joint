import 'dart:convert';
import 'package:burgerjoint/Utils/app_localizations.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  String emailAddress = '';
  bool _isButtonDisabled= false;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Global.scaffoldBackGroundColor,
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
                      padding: EdgeInsets.all(10.0),
                      child: ListView(
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Burger Joint",
                              style: TextStyle(
                                fontSize: 32,
                                color: Global.colorFromHex('ED1C24'),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),


                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            AppLocalizations.of(context)?.translate('forget_password') ?? 'Forget Password',
                            style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                emailField(),
                                SizedBox(
                                  height: 25,
                                ),
                                submitButton(),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: new Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.red,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),

                ],
              ),
            ),
          ),
        ));
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: AppLocalizations.of(context)?.translate('email') ?? 'Email',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String? value) {
        if (value!.length < 7 &&  value.contains("@"))  return AppLocalizations.of(context)?.translate('invalid_email') ?? 'Invalid Email';

        return '';
      },
      onSaved: (String? value) {
        emailAddress = value!;
      },
    );
  }

  Widget submitButton() {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        color:  _isButtonDisabled ? Colors.grey : Global.colorFromHex('ED1C24'),
        child: Text(
          AppLocalizations.of(context)?.translate('forget')?? 'Forget',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14,
              fontFamily: 'JOSEF'),
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            setState(() {
              _isButtonDisabled=true;
            });
            formKey.currentState!.save();

            /*
            forgetPasswordFunction(
                    "https://marshelles.com/api/mobile/reset-password",
                    emailAddress)
                .then((value) {
              if (value) {
                Utils.toastMessage("PLEASE CHECK YOUR EMAIL TO UPDATE YOUR PASSWORD");
              } else {
                Utils.toastMessage("PLEASE ENTER YOUR INVALID EMAIL");
              }
            });

            */
          }
        },
      ),
    );
  }

  static Future<bool> forgetPasswordFunction(
      String url, String emailAddress) async {
    Uri uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json'
        },
        body: json.encode({"email": emailAddress}));
    if (response.statusCode == 200)
      return true;
    else
      return false;
  }
}
