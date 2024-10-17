import 'package:flutter/material.dart';
import 'package:islami/models/sura/sura_details_args.dart';
import 'package:islami/ui/screens/quran/Quran.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_constants.dart';
import 'package:islami/utils/extensions/extensions.dart';

class QuranTab extends StatelessWidget {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Column(
      children: [Image.asset(AppAssets.quranLogo), buildSurasList(context)],
    );
  }

  Widget buildSurasList(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              const Divider(),
              buildTiles(context),
              const Divider(),
              buildSurasScrollList(),
            ],
          ),
          Container(width: 0.95, color: theme.primaryColor),
        ],
      ),
    );
  }

  Widget buildSurasScrollList() {
    return Expanded(
      child: ListView.builder(
        itemCount: AppConstants.arSuras.length,
        itemBuilder: (context, index) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                onButtonPress(index, context);
              },
              child: Text(
                AppConstants.arSuras[index],
                style: theme.textTheme.headlineMedium,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            )),
            Expanded(
                child: Text(
              "${AppConstants.versesNumber[index]}",
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            )),
          ],
        ),
      ),
    );
  }

  Widget buildTiles(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Text(
          context.localization.suraName,
          style: theme.textTheme.titleLarge,
          textAlign: TextAlign.center,
        )),
        Expanded(
            child: Text(
          context.localization.verses,
          style: theme.textTheme.titleLarge,
          textAlign: TextAlign.center,
        )),
      ],
    );
  }

  void onButtonPress(int index, BuildContext context) {
    Navigator.pushNamed(context, Quran.routeName,
        arguments: SuraDetailsArgs(
            suraName: "سورة ${AppConstants.arSuras[index]}",
            suraOrder: index + 1));
  }
}
