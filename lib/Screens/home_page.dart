import 'package:burgerjoint/Utils/global.dart';
import 'package:burgerjoint/Widgets/HomePage/home_page_widget.dart';
import 'package:burgerjoint/Widgets/custom_appbar.dart';
import 'package:burgerjoint/Widgets/drawer_widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  //FOR DRAWER
  final GlobalKey<ScaffoldState> _key =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key:  _key,
      appBar: CustomAppBar(title: "DELIVERING TO", backgroundColor: Global.colorFromHex('ED1C24') , onChanged: (value){if(value){_key.currentState!.openDrawer();}}),
      drawer: DrawerWidget(),
      body:  HomePageWidget(),
    );

  }

}
