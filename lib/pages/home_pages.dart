import 'package:flutter/material.dart';
import 'package:flutterweb/pages/project_pages.dart';
import 'package:flutterweb/pages/skill_pages.dart';
import 'package:flutterweb/pages/welcome_pages.dart';
import 'package:flutterweb/utils/globals.dart';
import 'package:flutterweb/widget/drawer_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../widget/topbar_content_widget.dart';
import 'about_page.dart';
import 'education_pages.dart';
import 'footer_pages.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final itemScrolController = ItemScrollController();
  final pageController = PageController(initialPage: 0);
  final itemPositionalListneer = ItemPositionsListener.create();

  List<Widget> pages = [
    WelcomePages(),
    AboutPage(),
    ProjectPages(),
    EducationPages(),
    SkillPages(),
    FooterPages()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: DrawerWidget(itemScrollController: itemScrolController),
      appBar: PreferredSize(
        preferredSize: Size(100, 100),
        child: TopbarContentWidget(
          itemScrollController: itemScrolController,
          opacity: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/back.jpeg"), fit: BoxFit.cover)),
          child: ScrollablePositionedList.builder(
              initialScrollIndex: 0,
              shrinkWrap: true,
              itemPositionsListener: itemPositionalListneer,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                final page = pages[index];
                return page;
              }),
        ),
      ),
    );
  }
}
