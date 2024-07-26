import 'package:flutter/material.dart';
import 'package:flutterweb/data/projects.dart';
import 'package:flutterweb/utils/constants.dart';
import 'package:flutterweb/utils/screen_helper.dart';
import 'package:flutterweb/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
class ProjectPages extends StatelessWidget {
  const ProjectPages({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
        mobile: _buildUI(ScreenHelper.mobileMaxWidth(context), context),
        tablet: _buildUI(tabletMaxWidth, context),
        desktop: _buildUI(desktopMaxWidth, context));
  }
  Widget _buildUI(double width, BuildContext context)=>
      ResponsiveWrapper(
          minWidth: width,
          maxWidth: width,
          defaultScale: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
                  Text("Project",style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    height: 1.3
                  ),),
          SizedBox(height: 5,),
          Wrap(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: 400,
                  maxHeight: 700,
                ),
                child: Text("This are my best project built in love with Flutter",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
              )
            ],
          ),
          SizedBox(height: 40,),
          LayoutBuilder(builder: (context,constraints){
            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: projects.map((d)=>SizedBox(
                width: constraints.maxWidth /2.0-20.0,
                child: Column(
                  children: [
                    Image.asset(d.image),
                    SizedBox(height: 5,),
                    Text(maxLines: 4,overflow: TextOverflow.ellipsis,d.description,
                    style: TextStyle(
                      color: captionColor,
                      fontSize: 20,
                    ),),
                    IconButton(onPressed: (){
                      Utils.launchURL("");
                    },
                        icon: FaIcon(FontAwesomeIcons.github),
                        color: Color(0xFFD9DEEC),iconSize: 24,)
                  ],
                ),
              )).toList(),
            );
          })
        ],
      ));
}
