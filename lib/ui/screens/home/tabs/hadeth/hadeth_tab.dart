import 'package:flutter/material.dart';
import 'package:islami/ui/screens/hadeth/hadeth.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_constants.dart';
import 'package:islami/utils/extensions/extensions.dart';

class HadethTab extends StatelessWidget {
  HadethTab({super.key});

  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Column(
      children: [
        Image.asset(AppAssets.hadethLogo),
        const Divider(),
        Text(
          context.localization.ahadeth,
          style: theme.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const Divider(),
        buildAhadethList()
      ],
    );
  }

  Widget buildAhadethList() {
    return Expanded(
      child: ListView.builder(
        itemCount: AppConstants.ahadeth.split("#").length - 1,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.pushNamed(context, Hadeth.routeName, arguments: index);
          },
          child: Text(
            "${context.localization.hadethNum} ${index + 1}",
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
