import 'package:burgerjoint/Models/gender.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRadio extends StatelessWidget {

  Gender _gender;
  CustomRadio(this._gender);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: _gender.isSelected ? Global.colorFromHex("#ED1C24") : Colors.white,
        child: Container(
          height: 55,
          width: 55,
          alignment: Alignment.center,
          margin: new EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              FaIcon(
                _gender.icon,
                color: _gender.isSelected ? Colors.white : Colors.black,
                size: 25,
              ),
              SizedBox(height: 10),
              Text(
                _gender.name,
                style: TextStyle(
                    color: _gender.isSelected ? Colors.white : Colors.black),
              )
            ],
          ),
        ));
  }
}