import 'package:flutter/material.dart';
import 'package:islami/ui/providers/theme_provider.dart';
import 'package:islami/ui/screens/home/home.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  static const String routeName = "Splash";

  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Home.routeName);
    });
    return Scaffold(
      body: Image.asset(
        themeProvider.splashImgPath,
      ),
    );
  }
}
