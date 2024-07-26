import 'package:flutter/material.dart';
import 'package:flutterweb/utils/constants.dart';
import 'package:flutterweb/utils/globals.dart';
import 'package:flutterweb/utils/screen_helper.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'header_logo_widget.dart';

class TopbarContentWidget extends StatefulWidget {
  const TopbarContentWidget({super.key,
  required this.itemScrollController,required this.opacity});


  final double opacity;
  final ItemScrollController itemScrollController;

  @override
  State<TopbarContentWidget> createState() => _TopbarContentWidgetState();
}

class _TopbarContentWidgetState extends State<TopbarContentWidget> {
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    final desktopHeader=PreferredSize(preferredSize: Size(screenSize.width,70),
        child: DesktopTabBar(
          widget: widget,
          screenSize: screenSize,
          itemScrollController: widget.itemScrollController,
        ));
    return ScreenHelper(mobile: buildMobileHeader(), tablet: desktopHeader,
        desktop: desktopHeader);
  }
}
class DesktopTabBar extends StatelessWidget {
  const DesktopTabBar({super.key,
  required this.itemScrollController,
    required this.widget,
    required this.screenSize
  });
  final Size screenSize;
  final TopbarContentWidget widget;
  final ItemScrollController?itemScrollController;

  InkWell menuItem({required int toPage,required String title}){
    return InkWell(
      onTap: ()=>itemScrollController!.scrollTo(
        index: toPage,
        duration: Duration(seconds: 2),
        curve: Curves.easeInOut,
      ),
      child: Text(title,
      style: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 20
      ),),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(widget.opacity),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 24,),
            menuItem(toPage: 0, title: "Home"),

            const SizedBox(width: 24,),
            menuItem(toPage: 1, title: "About"),

            const SizedBox(width: 24,),
            menuItem(toPage: 2, title: "My Project"),

            const SizedBox(width: 24,),
            menuItem(toPage: 3, title: "Education"),


            const SizedBox(width: 24,),
            menuItem(toPage: 0, title: "My Skills"),


            const SizedBox(width: 24,),
            menuItem(toPage: 0, title: "Contact Me"),
          ],
        ),
      ),
    );
  }
}
Widget buildMobileHeader()=>SafeArea(
  child: Padding(
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeaderLogoWidget(),
        GestureDetector(
          onTap: ()=>Globals.scaffoldKey.currentState!.openDrawer(),
          child: Icon(
            Icons.menu,
            color: Colors.white,
            size: 28,
          ),
        )
      ],
    ),
  ),
);