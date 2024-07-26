import 'package:flutter/material.dart';
import 'package:flutterweb/data/educations.dart';
import 'package:flutterweb/utils/constants.dart';
import 'package:flutterweb/utils/screen_helper.dart';
import 'package:flutterweb/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
class EducationPages extends StatelessWidget {
  const EducationPages({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(mobile: _buildUI(ScreenHelper.mobileMaxWidth(context), context), 
        tablet: _buildUI(tabletMaxWidth, context), desktop: _buildUI(desktopMaxWidth, context));
  }
  Widget _buildUI(double width,BuildContext context)=>SizedBox(
    height: MediaQuery.of(context).size.height,
    child: Padding(
      padding: EdgeInsets.only(top: 100),
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Education",style: GoogleFonts.oswald(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 30,
              height: 1.3
            ),),
            SizedBox(height: 5,),
            Wrap(
              children: [
                Text(education,style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,

                ),),
                SizedBox(height: 40,),
                LayoutBuilder(builder: (context,constriats){
               bool   defalutSize=false;
                  return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: educations.map((d)=>SizedBox(
                      width: constriats.maxWidth /2-20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(d.period,style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20
                          ),),
                          SizedBox(height: 5,),
                          Text(
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,

                            d.description,style: TextStyle(
                            color: captionColor,
                            fontSize: 20
                          ),),
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: (){
                              Utils.launchURL(d.linkName);
                            },
                            child: Text(d.linkName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),),
                          )

                        ],
                      ),
                    )).toList(),
                  );
                })
              ],
            )
          ],
        ),
      ),
    ),
  );
}
