import 'package:flutter/material.dart';
import 'package:flutterweb/utils/constants.dart';
import 'package:flutterweb/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
        mobile: _buildUI(ScreenHelper.mobileMaxWidth(context), context),
        tablet: _buildUI(tabletMaxWidth, context),
        desktop: _buildUI(desktopMaxWidth, context));
  }
  Widget _buildUI(double width, BuildContext context)=>SizedBox(
    height: MediaQuery.of(context).size.height,
    child: Center(
      child: LayoutBuilder(builder: (context,constraints){
        final style=GoogleFonts.oswald(
          color: Colors.white,
          fontSize: 24,
          height: 1.3
        );
        return Expanded(child: ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          child: Flex(
            direction: ScreenHelper.isMobile(context)?Axis.vertical:Axis.horizontal,
            children: [
              Expanded(
                  flex: ScreenHelper.isMobile(context)?0:3,
                  child: Lottie.asset("assets/animation/coder.json",width: 500)),
              SizedBox(width: 40,),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(aboutFirst,style: style,),
                  Text(aboutSecond,style: style,),
                  SizedBox(height: 5,),

                ],
              ))
            ],
          ),
        ));
      },),
    ),
  );
}
//hellow this work fine but i am find some error . please find this problem and get more result thank you
// in this video ot know aobut also to know aobut to know aobut to knwo 
//build().crate() this method is working but function not workign 
// in this comment. i will get and refund about to know also 
