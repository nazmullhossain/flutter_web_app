import 'package:flutter/material.dart';
import 'package:flutterweb/utils/globals.dart';

import '../widget/topbar_content_widget.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size(100,100),
        child: TopbarContentWidget(),
      ),
    );
  }
}
