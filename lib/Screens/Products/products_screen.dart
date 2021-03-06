import 'package:burgerjoint/Controllers/product_in_categories_controller.dart';
import 'package:burgerjoint/Models/product.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:burgerjoint/Widgets/ProductsWidgets/products_screen_widget.dart';
import 'package:burgerjoint/Widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:burgerjoint/Widgets/custom_appbar.dart';


class ProductsScreen extends StatefulWidget {
  final int categoryId;
  final String categoryName;
  ProductsScreen(this.categoryId,this.categoryName);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  final GlobalKey<ScaffoldState> _key =  GlobalKey<ScaffoldState>();
  List <Product> product = [];
  bool productValueUpdated=false;
  String itemsProducts='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Global.scaffoldBackGroundColor,
      key:  _key,
      appBar: CustomAppBar(title: "DELIVERING TO", backgroundColor: Global.colorFromHex(Global.mainColor) , onChanged: (value){if(value){_key.currentState!.openDrawer();}},branchName: Global.branch.name,searchedItems:(value){
        setState(() {
          itemsProducts=value;
        });
      } ),
      drawer: DrawerWidget(),
      body: ProductsWidget(
          product,
          widget.categoryName,
          itemsProducts
      ),
    );
  }

  @override
  void initState() {

    //"https://bj.marshelles.com/public/category/31/31"
    print(Global.testUrl+"category/"+Global.branch.branchId.toString()+"/"+widget.categoryId.toString());
    ProductInCategoriesController.productInCategories(Global.testUrl+"category/"+Global.branch.branchId.toString()+"/"+widget.categoryId.toString()).then((value) {
      setState(() {
        product=value;
      });

    });
  }
}
