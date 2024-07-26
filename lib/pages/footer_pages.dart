import 'package:flutter/material.dart';
import 'package:flutterweb/data/footer_items.dart';
import 'package:flutterweb/utils/constants.dart';
import 'package:flutterweb/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
class FooterPages extends StatelessWidget {
  const FooterPages({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(mobile: _buildUI(ScreenHelper.mobileMaxWidth(context), context),
        tablet: _buildUI(tabletMaxWidth, context), desktop: _buildUI(desktopMaxWidth, context));
  }
  Widget _buildUI(double width, BuildContext context)=>Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(builder: (context,constraints){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.symmetric(
              vertical: 50
            ),child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: footerItems.map((d)=>SizedBox(
                height: 120,
                width: ScreenHelper.isMobile(context)?constraints.maxWidth /2-20
                    :constraints.maxWidth /4-20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Image.asset(d.iconPath,width: 25,),
                       SizedBox(width: 15,),
                       Text(d.title,style: GoogleFonts.oswald(
                           fontSize: 18,
                           fontWeight: FontWeight.w700,
                           color: Colors.white

                       ),)
                     ],
                   ),
                    SizedBox(height: 15,),
                    RichText(
                        textAlign: TextAlign.start,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "${d.text1}/n",style: TextStyle(
                              color: captionColor,
                              height: 1.0
                          )
                          ),
                          TextSpan(
                              text: "${d.text2}/n",style: TextStyle(
                              color: captionColor,
                              height: 1.0
                          )
                          ),
                        ]
                      ),
                    )

                  ],
                ),
              ),).toList(),
            ),),
            SizedBox(height: 20,),
            Flex(direction: ScreenHelper.isMobile(context)?Axis.vertical:Axis.horizontal,
            mainAxisAlignment: ScreenHelper.isMobile(context)?MainAxisAlignment.center:
              MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.only(
                  bottom: 8
                ),child: Text("Copyright (c) 2023 $name.all right reserbed",

                style: TextStyle(
                  color: captionColor
                ),),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: MouseRegion(
                        child: Text("Privacy Policy",style: TextStyle(
                          color: captionColor
                        ),),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,

                      ),
                      child: Text("|",style: TextStyle(
                        color: captionColor
                      ),),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Text("Terms & Condition",
                        style: TextStyle(
                          color: captionColor
                        ),),
                      ),
                    )
                  ],
                )
              ],

            )
,SizedBox(height: 16,),
          ],
        );
      },),
    ),
  );
}
