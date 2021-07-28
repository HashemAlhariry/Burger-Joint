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
    return Column(
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
        )
      ],
    );
  }
}
