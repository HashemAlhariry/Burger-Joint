import 'package:burgerjoint/Controllers/get_nearest_branch_controller.dart';
import 'package:burgerjoint/Models/branch.dart';
import 'package:burgerjoint/Models/user.dart';
import 'package:burgerjoint/Providers/user_provider.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:burgerjoint/Widgets/HomePageWidgets/home_page_widget.dart';
import 'package:burgerjoint/Widgets/ShimmersEffectsWidgets/shimmers_effect.dart';
import 'package:burgerjoint/Widgets/custom_appbar.dart';
import 'package:burgerjoint/Widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart' as provider;

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  String branchName='';
  late Branch homePageBranch;
  late Position userLocation = new Position(longitude: 0, latitude: 0 , accuracy: 0.0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0, timestamp: null);
  final GlobalKey<ScaffoldState> _key =  GlobalKey<ScaffoldState>();

  // THIS VARIABLE TO CHECK GETTING BRANCH ID
  bool getBranchIdBool=false;
  //BranchID to get data in branch id
  late int branchId;


  late User user;
  @override
  Widget build(BuildContext context) {


    user = provider.Provider.of<UserProvider>(context, listen: true).user;

    return Scaffold(
      key:  _key,
      appBar: CustomAppBar(title: "DELIVERING TO", backgroundColor: Global.colorFromHex(Global.mainColor) , onChanged: (value){if(value){_key.currentState!.openDrawer();}},branchName: branchName,),
      drawer: DrawerWidget(),
      body:  getBranchIdBool ? HomePageWidget(branchId) : SingleChildScrollView(
        child: Column(
          children: [
             Padding(
               padding: const EdgeInsets.all(4.0),
               child: ShimmerEffect(MediaQuery.of(context).size.height/5, MediaQuery.of(context).size.width),
             ),
             GridView.count(
              shrinkWrap: true,
              childAspectRatio: 0.9,
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(6, (index) {
                return  Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ShimmerEffect(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width),
                );
              }),
            ),
          ],
        ),),
    );
  }

  @override
  void initState() {
    // used to get user`s data
    Future.delayed(
        Duration.zero,
            () => provider.Provider.of<UserProvider>(
                context,
                listen: false)
                .userLoggedIn(Global.loggedInUser));

    // used for getting user`s position
    determinePosition();
    super.initState();
   }


  // When the location services are not enabled or permissions are denied the Future will return an error
  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      GetNearestBranchController.getNearestBranch(Global.testUrl+"nearest-branch?", 0, 0).then((value) {
        //Branch details added to global
        Global.branch=value;

        setState(() {
          branchId=Global.branch.branchId;
          homePageBranch=value;
          branchName=homePageBranch.name;
          getBranchIdBool=true;
        });
      });

      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        GetNearestBranchController.getNearestBranch(Global.testUrl+"nearest-branch?", 0, 0).then((value) {

          //Branch details added to global
          Global.branch=value;

          setState(() {
            branchId=Global.branch.branchId;
            homePageBranch=value;
            branchName=homePageBranch.name;
            getBranchIdBool=true;
          });
        });
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.

      GetNearestBranchController.getNearestBranch(Global.testUrl+"nearest-branch?", 0, 0).then((value) {

        //Branch details added to global
        Global.branch=value;

        setState(() {
          branchId=Global.branch.branchId;
          homePageBranch=value;
          branchName=homePageBranch.name;
          getBranchIdBool=true;
        });
      });

      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    Position position = await Geolocator.getCurrentPosition();
    userLocation = position;

    // call function to get branch name with location
    GetNearestBranchController.getNearestBranch(Global.testUrl+"nearest-branch?", userLocation.latitude, userLocation.longitude).then((value) {

      //Branch details added to global
      Global.branch=value;

      setState(() {
        branchId=Global.branch.branchId;
        homePageBranch=value;
        branchName=homePageBranch.name;
        getBranchIdBool=true;
      });

    });

  }



}
