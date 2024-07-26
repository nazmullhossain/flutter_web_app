import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb/utils/constants.dart';
import 'package:flutterweb/utils/screen_helper.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';
class WelcomePages extends StatefulWidget {
  const WelcomePages({super.key});

  @override
  State<WelcomePages> createState() => _WelcomePagesState();
}

class _WelcomePagesState extends State<WelcomePages> {
  List<MaterialColor>colizeColor=[
    Colors.purple,
    Colors.amber,
    Colors.cyan,
    Colors.brown
  ];
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
        mobile: _buildUi(ScreenHelper.mobileMaxWidth(context)),
        tablet: _buildUi(tabletMaxWidth),
        desktop: _buildUi(desktopMaxWidth));
  }
  Widget _buildUi(double width)=>Container(
    height: MediaQuery.of(context).size.height,
    child: Center(
      child: LayoutBuilder(
        builder: (context,constraints){
          return ResponsiveWrapper(
              maxWidth: width,
              minWidth: width,
              child: Flex(

            direction: ScreenHelper.isMobile(context)?
            Axis.vertical:Axis.horizontal,
                children: [
                  Expanded(flex: ScreenHelper.isMobile(context)?0:3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      SizedBox(height: 24,),
                      Text(helloTag,style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),),
                      SizedBox(height: 16,),
                      Text(name,style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),),
                      SizedBox(height: 60,
                      child:       Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("I am",style: TextStyle(
                            fontFamily: 'Horizon',
                            fontSize: 40,
                            color: Colors.white,

                          ),)
                          ,SizedBox(width: 12,),
                          DefaultTextStyle(style: TextStyle(
                            fontSize: 40,
                            fontFamily: "Horizon",
                            color: Colors.white,
                          ), child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              RotateAnimatedText("Passionate"),
                              RotateAnimatedText("Hard Working"),
                              RotateAnimatedText("Flutter Developer"),
                            ],
                          ))
                        ],
                      ),),

                      SizedBox(height: 16,),
                      Padding(padding: EdgeInsets.only(
                        left: 16,
                        right: 15,
                      ),child: Text(miniDescription,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70
                      ),),),
                      SizedBox(height: 30,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 3,
                              color: Colors.white
                            )
                          ),
                          onPressed: (){},
                          child: AnimatedTextKit(animatedTexts: [
                            ColorizeAnimatedText("Download CV",
                                textStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,

                                ), colors: colizeColor)
                          ],))

                    ],
                  ),),
                  SizedBox(width: 48,),
                  Expanded(
                      flex: ScreenHelper.isMobile(context)?0:3,
                      child: Lottie.asset("assets/animation/yoga.json"))
                ],
          ));
        },
      ),
    ),

  );
}
