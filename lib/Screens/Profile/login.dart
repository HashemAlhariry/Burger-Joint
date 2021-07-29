import 'package:burgerjoint/Services/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/user.dart';
import '../../Utils/app_localizations.dart';
import '../../Utils/global.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Login> with Validation {
  String emailAddress = '';
  String password = '';
  bool _isButtonDisabled= false ;
  final formKey = GlobalKey<FormState>();

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
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(45.0, 10, 10, 10),
                      child: ListView(
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Text(
                              AppLocalizations.of(context)!.translate('log_in_with_your_email')!,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.all(15.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  emailField(),
                                  passwordField(),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  submitButton(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {

                                      },
                                      child: Text(
                                          AppLocalizations.of(context)!.translate('forgot_your_password')!,

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(17, 0, 15, 0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context)!.translate('dont_have_account')!,
                                    style: TextStyle(
                                        fontFamily: 'JOSEF', fontSize: 10),
                                  ),
                                  Expanded(
                                      child: SizedBox(
                                    width: 5,
                                  )),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        primary: Colors.black),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 4, 0, 0),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .translate('register')!,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'JOSEF'),
                                      ),
                                    ),
                                    onPressed: () {

                                      Navigator.of(context).push(Global.pageRouteBuilder(SignUp()));

                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              )),
                        ],
                      )),
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
          labelText: AppLocalizations.of(context)!.translate('email'),
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String? value) {
        if (value!.length < 7 && !value.contains("@")) {
          return AppLocalizations.of(context)!.translate('valid_email');
        }
        return '';
      },
      onSaved: (String? value) {
        emailAddress = value!;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: AppLocalizations.of(context)!.translate('password'),
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (val) {
        if (val!.isEmpty)
          return AppLocalizations.of(context)!.translate('empty');
        else if (val.length < 5)
          return AppLocalizations.of(context)!
              .translate('enter_password_more_than_six_character');
        return '';
      },
      onSaved: (String? value) {
        password = value!;
      },
    );
  }

  Widget submitButton() {

      return Container(
        height: 30,
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          color: _isButtonDisabled ? Colors.grey : Colors.black,
          child: Text(
            AppLocalizations.of(context)!.translate('login')!,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                fontFamily: 'JOSEF'),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {

              formKey.currentState!.save();
              setState(() {
                _isButtonDisabled=true;
              });
                /*
              User.logIn("${Global.globalUrl}/mobile/login", emailAddress,
                      password)
                  .then((value) async {
                if (value['message'] != "Wrong email!" &&
                    value['message'] != "Wrong Password!") {

                  Global.checkingRestart = false;
                  // Navigator.of(context).popUntil((route) => route.isFirst);
                  // Navigator.popAndPushNamed(context,"");

                  //save token and user data
                  Global.prefs = await SharedPreferences.getInstance();
                  Utils.toastMessage("Logged in Successfully");
                  setState(() {
                    Global.loggedInUser = User.loggedIn(emailAddress, password);
                    Global.userToken = value['message'];

                    //save all user data
                    Global.prefs.setString('password', password);
                    Global.prefs.setString('email', emailAddress);
                    Global.prefs.setString('token', value['message']);
                  });

                  RestartWidget.restartApp(context);
                } else {
                   setState(() {
                _isButtonDisabled=false;
                  });

                  Utils.toastMessage(value['message']);
                }
              });

              */

            }
          },
        ),
      );
  }
}
