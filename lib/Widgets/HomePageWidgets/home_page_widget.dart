import 'package:burgerjoint/Controllers/home_page_categories_controller.dart';
import 'package:burgerjoint/Models/home_page_categories.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {

  final int branchId;

  HomePageWidget(this.branchId);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState(branchId);

}

class _HomePageWidgetState extends State<HomePageWidget> {

  int branchId;
  _HomePageWidgetState(this.branchId);
  // LIST OF IMAGES THAT WILL APPEAR AT THE TOP HOMEPAGE
  List<HomePageCategory> homePageCategory = [
    //HomePageCategory('https://c4.wallpaperflare.com/wallpaper/219/42/474/food-burgers-burger-wallpaper-preview.jpg',2,'1',"") , HomePageCategory('https://c4.wallpaperflare.com/wallpaper/219/42/474/food-burgers-burger-wallpaper-preview.jpg',2,'1',"") ,HomePageCategory('https://c4.wallpaperflare.com/wallpaper/219/42/474/food-burgers-burger-wallpaper-preview.jpg',2,'1',"") ,HomePageCategory('https://c4.wallpaperflare.com/wallpaper/219/42/474/food-burgers-burger-wallpaper-preview.jpg',2,'1',"") ,HomePageCategory('https://c4.wallpaperflare.com/wallpaper/219/42/474/food-burgers-burger-wallpaper-preview.jpg',2,'1',"")
  ];

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 150,),
            GridView.count(
              shrinkWrap: true,
              childAspectRatio: 0.8,
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(homePageCategory.length, (index) {
                return GestureDetector(
                  onTap: (){

                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                    //Send page to products details

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 5,
                      child: Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all( 0.0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    homePageCategory[index].categoryImage,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(children: [
                            Expanded(child: Container()),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text( homePageCategory[index].categoryName,style:  GoogleFonts.rubik(
                          textStyle: TextStyle(letterSpacing: .5),
                          )  ),),

                          ],)
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
 
  }
  
  @override
  void initState() {
    // call categories in home screen with branch id
    print(branchId);
    HomePageCategoriesController.getNearestBranch(Global.testUrl+"branch/"+branchId.toString()).then((value) {
      setState(() {
        homePageCategory=value;
      });
    });
  }



}
