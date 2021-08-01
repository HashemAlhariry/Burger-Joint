import 'package:burgerjoint/Services/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

import '../../../Models/user.dart';
import '../../../Utils/app_localizations.dart';
import '../../../Utils/global.dart';

class SignUp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SignUp> with Validation {

  String userNameForm = '';
  String userLastNameForm = '';
  String userEmailForm = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';

  bool _showPassword = false;


  final formkey = GlobalKey<FormState>();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _pass = TextEditingController();



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
                              "Burger Joint",
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Global.colorFromHex('ED1C24'),
                                  fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(15.0),
                              child: Form(
                                key: formkey,
                                child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Text(
                                          AppLocalizations.of(context)?.translate('create_account') ?? 'Create Account',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'JOSEF')),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    emailField(),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    nameField(),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    lastNameField(),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    passwordField(),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    passwordFieldConfirmation(),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    mobileField(),
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

  Widget nameField() {
    return TextFormField(
      cursorColor: Colors.grey,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: AppLocalizations.of(context)?.translate('name') ?? 'Name',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
        validator: (String? value){
          if (value!.length < 3) {
            return AppLocalizations.of(context)?.translate('invalid_name') ?? 'Please Enter Correct Name';
          }
          return '';
        },
      onSaved: (String? value) {
        userNameForm = value!;
        },
    );
  }

  Widget lastNameField() {
    return TextFormField(
      cursorColor: Colors.grey,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: AppLocalizations.of(context)?.translate('last_name')??'Last Name',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String? value) {
        if (value!.length < 3) {
          return AppLocalizations.of(context)?.translate('invalid_name') ?? 'Please Enter Correct Name';
        }
        return '';
      },
      onSaved: (String? value) {
        userLastNameForm = value!;
      },
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: AppLocalizations.of(context)?.translate('email') ?? 'Email',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String? value) {
        if (value!.length < 7 && !value.contains("@")) {
          return AppLocalizations.of(context)?.translate('invalid_email') ?? 'Invalid Email';
        }
        return '';
      },
      onSaved: (String? value) {
        userEmailForm = value!;
      },
    );
  }

  Widget mobileField() {
    return TextFormField(
      cursorColor: Colors.grey,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: AppLocalizations.of(context)?.translate('mobile') ?? 'Mobile Number',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String? value) {
        if (value!.length < 11) {
          return AppLocalizations.of(context)?.translate('valid_mobile_number') ?? 'Valid Mobile Number';
        }
        return '';
      },
      onSaved: (String? value) {
        phone = value!;
      },
    );
  }

  Widget passwordField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: TextFormField(
            cursorColor: Colors.grey,
            controller: _pass,
            obscureText: !this._showPassword,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              labelText: AppLocalizations.of(context)?.translate('password') ?? 'password',
              labelStyle: TextStyle(
                  fontFamily: 'JOSEF',
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              hintText: '',
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: this._showPassword ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() => this._showPassword = !this._showPassword);
                },
              ),
            ),
            validator: (val) {

              if (val!.isEmpty)
                return AppLocalizations.of(context)?.translate('empty') ?? 'Empty';
              else if (val.length < 5)
                return AppLocalizations.of(context)?.translate('enter_password_more_than_six_character') ?? 'Enter Password More than six characters';

            },
            onSaved: (String? value) {
              password = value!;
            },
          ),
        ),
      ],
    );
  }

  Widget passwordFieldConfirmation() {
    return TextFormField(
      cursorColor: Colors.grey,
      controller: _confirmPass,
      obscureText: !this._showPassword,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: AppLocalizations.of(context)?.translate('repeat_password') ?? 'Repeat Password',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (val) {
        if (val!.isEmpty) return AppLocalizations.of(context)?.translate('empty') ?? 'Empty';
        if (val != _pass.text)
          return AppLocalizations.of(context)?.translate('not_match') ?? 'Not Match';
        return null;
      },
      onSaved: (String? value) {
        confirmPassword = value!;
      },
    );
  }

  Widget submitButton() {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width,
      child:  RaisedButton(
        color:  Global.colorFromHex('#ED1C24'),
        child: Text(
          AppLocalizations.of(context)?.translate('continue') ?? 'Continue',
          style: TextStyle(
              color:Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14,
              fontFamily: 'JOSEF'),
        ),
        onPressed: () async {
          if (formkey.currentState!.validate()) {


            formkey.currentState!.save();
            User user = new User.signUpUser(
                userNameForm + " " + userLastNameForm,
                userEmailForm,
                password,
                phone);



          }
        },
      ),
    );
  }


  _showDialog(BuildContext context) {

    VoidCallback continueCallBack = () => {
      Navigator.of(context).pop(),
      // code on continue comes here

    };
    BlurryDialog  alert = BlurryDialog("Abort","Are you sure you want to abort this operation?",continueCallBack);


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
/*
showAlertDialog(BuildContext context,String language,User user) {
  // Create button
  Widget okButton = FlatButton(
    child: Text(AppLocalizations.of(context)?.translate('accept')),
    onPressed: () {


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
  */

class BlurryDialog extends StatelessWidget {

  String title;
  String content;
  VoidCallback continueCallBack;

  BlurryDialog(this.title, this.content, this.continueCallBack);
  TextStyle textStyle = TextStyle (color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child:  AlertDialog(
          title: new Text(title,style: textStyle,),
          content: new Text(content, style: textStyle,),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Continue"),
              onPressed: () {
                continueCallBack();
              },
            ),
            new FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}