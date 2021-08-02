import 'package:burgerjoint/Widgets/ProductsWidgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsDetailsWidget extends StatefulWidget {
  const ProductsDetailsWidget({Key? key}) : super(key: key);

  @override
  _ProductsDetailsWidgetState createState() => _ProductsDetailsWidgetState();
}

class _ProductsDetailsWidgetState extends State<ProductsDetailsWidget> {
  @override
  Widget build(BuildContext context) {
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
                //Navigator.pop(context);
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
                "5 INCH BURGER",
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
            10,
            (index) => ProductCardWidget(
                  imageUrl:
                      "https://images.unsplash.com/photo-1543339469-94ba2391431f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80",
                  title: "Bouncy Burger",
                  description:
                      "2 Burger Patties Beef Bacon, 2 Smoked Cheddar Cheese Slices, Tomatoes, Onions,Lettuce, Pickles, Ketchup and Mayonnaise Sauce",
                  price: 80,
                  id: index,
                )),
      ],
    );
  }
}
