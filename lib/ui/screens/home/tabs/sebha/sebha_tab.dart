import 'package:flutter/material.dart';
import 'package:islami/ui/providers/theme_provider.dart';
import 'package:islami/utils/extensions/extensions.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  late List<String> azkar;
  int currentIndex = 0;
  int counter = 0;
  late ThemeData theme;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    themeProvider = Provider.of(context);
    azkar = [
      context.localization.subhanAllah,
      context.localization.thanksToAllah,
      context.localization.allahAkbar
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildSebha(),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(context.localization.tasbeehsNumber,
                style: theme.textTheme.titleLarge),
          ),
          buildCounterBox(),
          buildButton(context)
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          azkar[currentIndex],
          style: theme.textTheme.displaySmall,
        ));
  }

  Widget buildCounterBox() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: 69,
      height: 81,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: theme.primaryColorDark,
      ),
      child: Text(
        "$counter",
        style: theme.textTheme.headlineMedium,
      ),
    );
  }

  Widget buildSebha() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 86.0,
          ),
          child: Image.asset(themeProvider.sebhaBody),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 11),
          child: Image.asset(themeProvider.sebhaHead),
        ),
      ],
    );
  }

  void onPressed() {
    counter++;
    if (counter == 33) {
      currentIndex = (currentIndex + 1) % azkar.length;
      counter = 0;
    }
    setState(() {});
  }
}
