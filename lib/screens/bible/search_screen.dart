import 'package:flutter/material.dart';
import '../../models/verse.dart';

class SearchScreen extends StatefulWidget {

  final List<Verse> bible;

  const SearchScreen({super.key, required this.bible});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<Verse> results = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Search Bible"),
      ),

      body: Column(

        children: [

          Padding(

            padding: const EdgeInsets.all(10),

            child: TextField(

              decoration: const InputDecoration(
                hintText: "Search verse...",
              ),

              onChanged: (v) {

                setState(() {

                  results = widget.bible
                      .where((verse) =>
                      verse.text.contains(v))
                      .toList();

                });

              },

            ),

          ),

          Expanded(

            child: ListView.builder(

              itemCount: results.length,

              itemBuilder: (context, i) {

                final verse = results[i];

                return ListTile(

                  title: Text(
                      "${verse.book} ${verse.chapter}:${verse.verse}"),

                  subtitle: Text(verse.text),

                );

              },

            ),

          )

        ],

      ),

    );

  }

}
