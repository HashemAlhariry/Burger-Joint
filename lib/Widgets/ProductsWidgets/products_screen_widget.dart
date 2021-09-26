import 'package:burgerjoint/Models/product.dart';
import 'package:burgerjoint/Widgets/ProductsWidgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsWidget extends StatefulWidget {

  final List<Product> products;

  final String categoryName;

  String itemsProducts;

  ProductsWidget(this.products,this.categoryName,this.itemsProducts);

  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();

}

class _ProductsWidgetState extends State<ProductsWidget> {
  List<Product> tempProducts=[];
  @override
  Widget build(BuildContext context) {
    updateItems(widget.itemsProducts);
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Color(0xffED1C24),
              iconSize: 26,
              icon: Icon(
                Icons.arrow_back_ios,
              ),
            ),
            Text(
              "Choose what you love",
              style: GoogleFonts.ptSans(
                fontWeight: FontWeight.bold,
                fontSize: 27,
                color: Color(0xff43454D),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 22,
                color: Color(0xffED1C24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                  widget.categoryName.toUpperCase(),
                style: GoogleFonts.bebasNeue(
                  fontWeight: FontWeight.bold,
                  fontSize: 33,
                  color: Color(0xff040404),
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


        ...List.generate(
            tempProducts.length,
            (index) => ProductCardWidget(
                 product:tempProducts[index]
                )),
      ],
    );
  }
  void updateItems(String itemsToSearch){
    setState(() {
      tempProducts=[];
    });

    for(int i=0;i<widget.products.length;i++){
      if(widget.products[i].productTitle.toUpperCase().contains(itemsToSearch.toUpperCase())){
        tempProducts.add(widget.products[i]);
      }
    }

  }
  @override
  void initState() {
    tempProducts=widget.products;
  }
}
