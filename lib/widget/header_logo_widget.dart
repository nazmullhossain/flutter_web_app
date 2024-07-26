import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class HeaderLogoWidget extends StatelessWidget {
  const HeaderLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final style=GoogleFonts.oswald(
      color: Colors.white,
      fontSize: 36,
      fontWeight: FontWeight.bold
    );
    return Padding(padding:
    EdgeInsets.only(
      left: 30,
      right: 10
    ),child: RichText(
      text: TextSpan(
        children: [TextSpan(
          text: name.characters.first,
          style: style
        ),
          TextSpan(text: ".",style:style)
        ]
      ),
    ),);
  }
}
