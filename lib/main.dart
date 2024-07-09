import 'package:flutter/material.dart';
import 'package:flutterweb/pages/home_pages.dart';
import 'package:flutterweb/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePages(),
      title: name,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
          platform: TargetPlatform.android,
          scaffoldBackgroundColor: backgroundColor,
          primaryColor: primaryColor,
          canvasColor: backgroundColor,
          textTheme: GoogleFonts.latoTextTheme()),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.resize(450, name: TABLET),
          const ResponsiveBreakpoint.resize(450, name: DESKTOP),
        ],
      ),
    );
  }
}
