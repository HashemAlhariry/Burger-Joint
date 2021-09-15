import 'package:burgerjoint/Models/user.dart';
import 'package:burgerjoint/Providers/user_provider.dart';
import 'package:burgerjoint/Screens/Profile/UserSignIn/forget_password.dart';
import 'package:burgerjoint/Screens/Profile/UserSignIn/signup.dart';
import 'package:burgerjoint/Services/user_authentication.dart';
import 'package:burgerjoint/Services/validation.dart';
import 'package:burgerjoint/Widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Utils/app_localizations.dart';
import '../../../Utils/global.dart';
import 'package:provider/provider.dart' as provider;

class Login extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Login> with Validation {

  String userName = '';
  String password = '';
  bool _isButtonDisabled= false ;
  final formKey = GlobalKey<FormState>();

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
                      padding: EdgeInsets.all(10.0),
                      child: ListView(
                        children: <Widget>[


                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                            child: Center(
                              child: Text(
                                "Burger Joint",
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Global.colorFromHex('ED1C24'),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 5, 0, 0),
                            child: Center(
                              child: Text(
                                "All Time Burger",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Global.colorFromHex('ED1C24'),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0,0,15.0,0),
                            child: Text(
                               'Login',
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14 ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(15.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 userNameField(),
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
                                        Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (ctx) => ForgetPassword(),
                                        ),
                                      );
                                      },
                                      child: Text(
                                          AppLocalizations.of(context)?.translate('forgot_your_password') ?? 'Forget Your Password',

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
                                    AppLocalizations.of(context)?.translate('dont_have_account') ?? 'Don\'t Have Account' ,
                                    style: TextStyle(
                                        fontFamily: 'JOSEF', fontSize: 12),
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
                                        AppLocalizations.of(context)?.translate('sign_up') ?? 'Sign Up',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'JOSEF'),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (ctx) => SignUp(),
                                        ),
                                      );


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

  Widget userNameField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: AppLocalizations.of(context)?.translate('user_name') ?? 'User Name',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (String? value) {
        if (value!.length < 2) {
          return AppLocalizations.of(context)?.translate('invalid_user_name') ?? 'Invalid User Name';
        }

      },
      onSaved: (String? value) {
        userName = value!;
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
          labelText: AppLocalizations.of(context)?.translate('password') ?? 'Password',
          labelStyle: TextStyle(
              fontFamily: 'JOSEF',
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      validator: (val) {
        if (val!.isEmpty)
          return AppLocalizations.of(context)?.translate('empty') ?? 'Empty';
        else if (val.length < 5)
          return AppLocalizations.of(context)?.translate('enter_password_more_than_six_character') ?? 'Enter Password More Than Siz Characters';

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
          color: _isButtonDisabled ? Colors.grey : Global.colorFromHex('ED1C24'),
          child: Text(
            AppLocalizations.of(context)?.translate('login') ?? 'Login',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                fontFamily: 'JOSEF'),
          ),
          onPressed: !_isButtonDisabled ?  () {
                if (formKey.currentState!.validate()) {

                  formKey.currentState!.save();
                  setState(() {
                    _isButtonDisabled=true;
                  });
                  UserAuthentication.logIn(Global.testUrl+"auth/token" , userName.trim() , password.trim()).then((value) async {


                    if(value['access_token']!=null){
                      //save user data
                      Global.prefs = await SharedPreferences.getInstance();
                      //save all user data
                      Global.prefs.setString('password', password);
                      Global.prefs.setString('username', userName);
                      Global.prefs.setString('token', value['access_token']);
                      Global.userToken = value['access_token'];



                      Global.loggedInUser= User.loggedIn(userName, "", password, "", 1);
                      //pop screen and update new user
                      provider.Provider.of<UserProvider>(
                          context,
                          listen: false)
                          .userLoggedIn(User.loggedIn(userName, "", password, "", 1));

                      Navigator.of(context).pop();
                    }else{
                      Global.toastMessage(value['error_description']);
                      setState(() {
                        _isButtonDisabled=false;
                      });
                    }


                  });


                }




          } : null,
        ),
      );
  }

}
