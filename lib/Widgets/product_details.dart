import 'package:burgerjoint/Widgets/product_card_design.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
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
              onPressed: () {},
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
            (index) => ProductCardDesign(
                  imageUrl:
                      "https://cdn-sharing.adobecc.com/content/storage/id/urn:aaid:sc:US:7a727069-b0a9-4385-92e5-8f7801d8c401;revision=0?component_id=75640846-928a-4cb2-bad7-1d3becedb8f8&api_key=CometServer1&access_token=1627592836_urn%3Aaaid%3Asc%3AUS%3A7a727069-b0a9-4385-92e5-8f7801d8c401%3Bpublic_557e57ad286cfdd839b7a4ac9fb912052bdf7cac",
                  title: "Bouncy Burger",
                  description:
                      "2 Burger Patties Beef Bacon, 2 Smoked Cheddar Cheese ….",
                  price: 80,
                  id: index,
                )),
      ],
    );
  }
}
