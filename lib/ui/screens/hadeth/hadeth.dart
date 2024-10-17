import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/widgets/main_content_page.dart';

class Hadeth extends StatefulWidget {
  static String routeName = "Hadeth";

  Hadeth({super.key});

  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  String hadethContent = "";
  String hadethTitle = "";

  @override
  Widget build(BuildContext context) {
    int hadethOrder = ModalRoute.of(context)!.settings.arguments as int;
    if (hadethContent.isEmpty) {
      readFileContent(hadethOrder);
    }
    return MainContentPage(
        title: hadethTitle, addPlayIcon: false, content: hadethContent);
  }

  Future<void> readFileContent(int hadethOrder) async {
    hadethContent = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadeth = hadethContent.split("#");
    ahadeth[hadethOrder] = ahadeth[hadethOrder].trim();
    List<String> hadethLines = ahadeth[hadethOrder].split("\n");
    hadethTitle = hadethLines[0];
    hadethLines.removeAt(0);
    hadethContent = hadethLines.join().trim();
    setState(() {});
  }
}
