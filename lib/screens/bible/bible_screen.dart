import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xml/xml.dart';

class BibleScreen extends StatefulWidget {
  const BibleScreen({super.key});

  @override
  State<BibleScreen> createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {

  List books = [];
  String selectedBook = "";
  int selectedChapter = 1;

  List verses = [];

  @override
  void initState() {
    super.initState();
    loadBible();
  }

  Future loadBible() async {

    final xmlString =
        await rootBundle.loadString("assets/bible/Bible.xml");

    final document = XmlDocument.parse(xmlString);

    final bibleBooks = document.findAllElements("BIBLEBOOK");

    setState(() {

      books = bibleBooks.toList();
      selectedBook = books.first.getAttribute("bname")!;

      loadChapter();

    });

  }

  void loadChapter() {

    final book =
        books.firstWhere((b) => b.getAttribute("bname") == selectedBook);

    final chapter = book
        .findElements("CHAPTER")
        .firstWhere((c) => c.getAttribute("cnumber") == "$selectedChapter");

    verses = chapter.findElements("VERS").toList();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text("Telugu Bible"),

        actions: [

          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),

          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),

        ],

      ),

      body: books.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(

              children: [

                /// BOOK SELECTOR

                DropdownButton(

                  value: selectedBook,

                  items: books.map((book) {

                    return DropdownMenuItem(

                      value: book.getAttribute("bname"),

                      child: Text(book.getAttribute("bname")),

                    );

                  }).toList(),

                  onChanged: (value) {

                    setState(() {

                      selectedBook = value!;
                      selectedChapter = 1;

                      loadChapter();

                    });

                  },

                ),

                /// CHAPTER SELECTOR

                DropdownButton(

                  value: selectedChapter,

                  items: List.generate(150, (i) {

                    return DropdownMenuItem(

                      value: i + 1,

                      child: Text("Chapter ${i + 1}"),

                    );

                  }),

                  onChanged: (value) {

                    setState(() {

                      selectedChapter = value!;
                      loadChapter();

                    });

                  },

                ),

                const Divider(),

                /// VERSES

                Expanded(

                  child: ListView.builder(

                    itemCount: verses.length,

                    itemBuilder: (context, index) {

                      final verse = verses[index];

                      final text = verse.innerText;

                      final number = verse.getAttribute("vnumber");

                      return Padding(

                        padding: const EdgeInsets.all(10),

                        child: GestureDetector(

                          onLongPress: () {},

                          child: RichText(

                            text: TextSpan(

                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),

                              children: [

                                TextSpan(
                                  text: "$number ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),

                                TextSpan(text: text),

                              ],

                            ),

                          ),

                        ),

                      );

                    },

                  ),

                )

              ],

            ),

    );

  }
}
