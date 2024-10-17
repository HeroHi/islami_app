import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/models/sura/sura_details_args.dart';
import 'package:islami/ui/widgets/main_content_page.dart';

class Quran extends StatefulWidget {
  static String routeName = "Quran";

  Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  String suraContent = "";

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (suraContent.isEmpty) {
      readFileContent(args.suraOrder);
    }
    return MainContentPage(
        title: args.suraName, addPlayIcon: true, content: suraContent);
  }

  Future<void> readFileContent(int suraOrder) async {
    suraContent =
        await rootBundle.loadString("assets/files/suras/$suraOrder.txt");
    List<String> verses = suraContent.split("\n");

    for (int i = 0; i < verses.length; i++) {
      verses[i] += "(${i + 1})";
    }
    suraContent = verses.join();
    setState(() {});
  }
}
