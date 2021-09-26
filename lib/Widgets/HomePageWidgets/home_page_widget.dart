import 'package:burgerjoint/Controllers/home_page_categories_controller.dart';
import 'package:burgerjoint/Models/home_page_categories.dart';
import 'package:burgerjoint/Screens/Products/products_screen.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {

  String itemsToCheck;
  final int branchId;
  HomePageWidget(this.branchId,this.itemsToCheck);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState(branchId);

}

class _HomePageWidgetState extends State<HomePageWidget> {


  int branchId;

  _HomePageWidgetState(this.branchId);

  // LIST OF IMAGES THAT WILL APPEAR AT THE TOP HOMEPAGE
  List<HomePageCategory> homePageCategory = [];
  List<HomePageCategory> tempHomePageCategory = [];


  @override
  Widget build(BuildContext context) {

    updateItems(widget.itemsToCheck);
    return Container(
      color: Colors.grey.shade100,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 22,
                    color: Color(0xffED1C24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                  child: Center(
                    child: Text(
                      "All Time Burger",
                      style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 22,
                    color: Color(0xffED1C24),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            GridView.count(
              shrinkWrap: true,
              childAspectRatio: 0.8,
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(tempHomePageCategory.length, (index) {
                return GestureDetector(
                  onTap: (){
                    //Send page to products menu
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsScreen(tempHomePageCategory[index].categoryId,tempHomePageCategory[index].categoryName)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                      elevation: 15,
                      child: Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all( 0.0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: CachedNetworkImage(
                                  imageUrl: tempHomePageCategory[index].categoryImage,
                                  placeholder: (context, url) => Center(child: new CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red))),
                                  errorWidget: (context, url, error) => new Icon(Icons.fastfood_sharp),
                                ),
                                ),
                              ),
                            ),
                          ),
                          Column(children: [
                            Expanded(child: Container()),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text( tempHomePageCategory[index].categoryName,style: GoogleFonts.bebasNeue(
                                fontSize: 24,
                                color: Color(0xff262626),
                              ), ),),
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
  
  void updateItems(String itemsToSearch){
    setState(() {
      tempHomePageCategory=[];
    });

    for(int i=0;i<homePageCategory.length;i++){
      if(homePageCategory[i].categoryName.toUpperCase().contains(itemsToSearch.toUpperCase())){
        tempHomePageCategory.add(homePageCategory[i]);
      }
    }
    
  }
  
  @override
  void initState() {

 
    // call categories in home screen with branch id
    HomePageCategoriesController.homePageCategories(Global.testUrl+"branch/"+branchId.toString()).then((value) {
      setState(() {
        homePageCategory=value;
        tempHomePageCategory=homePageCategory;
      });
    });
  }



}
