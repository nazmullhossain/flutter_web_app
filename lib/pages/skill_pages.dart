import 'package:flutter/material.dart';
import 'package:flutterweb/data/skill_list.dart';
import 'package:flutterweb/utils/constants.dart';
import 'package:flutterweb/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';
class SkillPages extends StatelessWidget {
  const SkillPages({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
        mobile: _buildUI(ScreenHelper.mobileMaxWidth(context), context),
        tablet: _buildUI(tabletMaxWidth, context), 
        desktop: _buildUI(desktopMaxWidth, context));
  }
  Widget _buildUI(double width,BuildContext context)=>ResponsiveWrapper(
    maxWidth: width,
      minWidth: width,
      child: Flex(
        direction: ScreenHelper.isMobile(context)?Axis.vertical:Axis.horizontal,
        children: [
          Expanded(
              flex: ScreenHelper.isMobile(context)?0:2,
              child: Lottie.asset("assets/animation/skills.json",width: 500),
          ),
          SizedBox(width: 40,),
          Expanded(
              flex: ScreenHelper.isMobile(context)?0:4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text("SKILLS",style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 20,
                height: 1.3
              ),),
                  SizedBox(height: 12,),
                  Text(skill,style: TextStyle(
                    color: captionColor,
                    fontSize: 20,
                  ),),
                  SizedBox(height: 16,),
                  Column(
                    children: skills.map((d)=>Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Expanded(
                              flex: d.percentage,
                              child: Container(
                            padding: EdgeInsets.only(left: 12),
                                alignment: Alignment.centerLeft,
                                height: 30,
                                  color: Colors.white,
                                child: Text(d.skill),
                                
                          )),
                          SizedBox(width: 12,),
                          Expanded(
                              flex: 100-d.percentage,
                              child: Divider(color: Colors.white,)),
                          Text("${d.percentage}%",style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),)
                        ],
                      ),
                    )).toList(),
                  )
          ],))
        ],
      ));
}
