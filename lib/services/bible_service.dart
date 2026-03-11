import 'package:flutter/services.dart';
import 'package:xml/xml.dart';
import '../models/verse.dart';

class BibleService {

  static Future<List<Verse>> loadBible() async {

    final raw = await rootBundle.loadString('assets/bible/Bible.xml');

    final document = XmlDocument.parse(raw);

    final books = document.findAllElements("BIBLEBOOK");

    List<Verse> verses = [];

    for (var book in books) {

      String bookName = book.getAttribute("bname") ?? "";

      for (var chapter in book.findElements("CHAPTER")) {

        int chapterNumber = int.parse(chapter.getAttribute("cnumber")!);

        for (var verse in chapter.findElements("VERS")) {

          verses.add(

            Verse(
              book: bookName,
              chapter: chapterNumber,
              verse: int.parse(verse.getAttribute("vnumber")!),
              text: verse.innerText,
            ),

          );

        }

      }

    }

    return verses;

  }

}
