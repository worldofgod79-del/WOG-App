import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../models/verse.dart';

class ChapterScreen extends StatefulWidget {

  final List<Verse> bible;
  final String book;
  final int chapter;
  final double fontSize;

  const ChapterScreen({
    super.key,
    required this.bible,
    required this.book,
    required this.chapter,
    required this.fontSize,
  });

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {

  Set<int> selected = {};

  @override
  Widget build(BuildContext context) {

    final verses = widget.bible.where((v) =>
    v.book == widget.book && v.chapter == widget.chapter).toList();

    return ListView.builder(

      itemCount: verses.length,

      itemBuilder: (context, i) {

        final verse = verses[i];

        bool isSelected = selected.contains(i);

        return GestureDetector(

          onLongPress: () {

            setState(() {
              selected.add(i);
            });

          },

          onTap: () {

            if (selected.isNotEmpty) {

              setState(() {

                if (selected.contains(i)) {
                  selected.remove(i);
                } else {
                  selected.add(i);
                }

              });

            }

          },

          child: Container(

            padding: const EdgeInsets.all(12),

            color: isSelected ? Colors.yellow.shade200 : null,

            child: RichText(

              text: TextSpan(

                style: TextStyle(
                  fontSize: widget.fontSize,
                  color: Colors.black,
                ),

                children: [

                  TextSpan(
                    text: "${verse.verse} ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  TextSpan(text: verse.text)

                ],

              ),

            ),

          ),

        );

      },

    );

  }

}
