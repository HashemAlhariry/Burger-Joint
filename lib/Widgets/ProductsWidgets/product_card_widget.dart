import 'package:burgerjoint/Models/product.dart';
import 'package:burgerjoint/Screens/Products/product_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCardWidget extends StatelessWidget {

  final Product product;

  const ProductCardWidget({
    Key? key,
   required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ProductDetailsScreen(
              product:product
            ),
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * .22,
          child: Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.0),
            ),
            elevation: 15,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Hero(
                      tag: product.productId,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .35,
                        child: Image.network(
                          product.productImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          product.productTitle,
                          style: GoogleFonts.bebasNeue(
                            fontSize: 24,
                            color: Color(0xff262626),
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Text(
                            product.productDescription,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.ptSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff5B5B5B),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFED1C24),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10))),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              product.productPrice.toString(),
                              style: GoogleFonts.oswald(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
