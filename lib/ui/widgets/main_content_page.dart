import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/providers/theme_provider.dart';
import 'package:islami/ui/widgets/main_app_bar.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../models/sura/sura_details_args.dart';

class MainContentPage extends StatefulWidget {
  static String routeName = "MainContentPage";
  String title;
  bool addPlayIcon;
  String content;

  MainContentPage(
      {required this.title, required this.addPlayIcon, required this.content});

  @override
  State<MainContentPage> createState() => _MainContentPageState();
}

class _MainContentPageState extends State<MainContentPage> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    ThemeProvider themeProvider = Provider.of(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(themeProvider.bgImgPath), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          extendBody: true,
          appBar: buildAppBar(context, addBackButton: true),
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: theme.primaryColorLight,
            ),
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 29),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                buildTitle(context),
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  width: 270,
                  height: 1,
                  color: theme.primaryColor,
                ),
                buildContent()
              ],
            ),
          ),
        ));
  }

  Widget buildContent() {
    return Expanded(
      child: SingleChildScrollView(
          child: widget.content.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Text(
                  widget.content,
                  style: theme.textTheme.headlineSmall,
                  textDirection: TextDirection.rtl,
                )),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.play_circle),
          const SizedBox(
            width: 20,
          ),
          Text(
            widget.title,
            style: theme.textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
