import 'package:flutter/material.dart';
import 'package:islami/ui/providers/theme_provider.dart';
import 'package:islami/ui/screens/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/screens/home/tabs/settings/settings_tab.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/extensions/extensions.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../widgets/main_app_bar.dart';
import 'tabs/radio/radio_tab.dart';

class Home extends StatefulWidget {
  static const routeName = "Home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [
    const RadioTab(),
    SebhaTab(),
    HadethTab(),
    QuranTab(),
    SettingsTab(),
  ];
  int currentTabIndex = 0;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(themeProvider.bgImgPath), fit: BoxFit.fill)),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.transparent,
        appBar: buildAppBar(context),
        bottomNavigationBar: buildBottomNavigationBar(context),
        body: screens[currentTabIndex],
      ),
    );
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: themeProvider.bottomNavBarColor,
      ),
      child: BottomNavigationBar(
        iconSize: 40,
        items: [
          BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(AppAssets.radioIcon)),
              label: context.localization.radio),
          BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(AppAssets.sebhaIcon)),
              label: context.localization.sebha),
          BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(AppAssets.hadethIcon)),
              label: context.localization.ahadeth),
          BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(AppAssets.quranIcon)),
              label: context.localization.quran),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: context.localization.settings)
        ],
        onTap: (index) {
          currentTabIndex = index;
          setState(() {});
        },
        currentIndex: currentTabIndex,
        selectedItemColor: themeProvider.bottomNavBarSelectedColor,
      ),
    );
  }
}
