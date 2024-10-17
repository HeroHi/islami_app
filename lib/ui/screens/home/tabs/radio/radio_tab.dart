import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/extensions/extensions.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(AppAssets.radioLogo),
        Text(
          context.localization.quranRadio,
          style: theme.textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.skip_previous,
                color: theme.primaryColor,
              ),
              Icon(
                Icons.play_arrow,
                color: theme.primaryColor,
                size: 60,
              ),
              Icon(
                Icons.skip_next,
                color: theme.primaryColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
