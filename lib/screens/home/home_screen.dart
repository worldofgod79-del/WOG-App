import 'package:flutter/material.dart';
import '../bible/bible_screen.dart';
import '../songs/songs_screen.dart';
import '../books/books_screen.dart';
import '../live/live_screen.dart';

class HomeScreen extends StatefulWidget {
const HomeScreen({super.key});

@override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

int index = 0;

final pages = const [
BibleScreen(),
SongsScreen(),
BooksScreen(),
LiveScreen(),
];

@override
Widget build(BuildContext context) {
return Scaffold(

  appBar: AppBar(
    title: const Text("WOG App"),
  ),

  drawer: Drawer(
    child: ListView(
      children: const [

        DrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff3a7bd5), Color(0xff00d2ff)],
            ),
          ),
          child: Text(
            "World Of God",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),

        ListTile(
          leading: Icon(Icons.track_changes),
          title: Text("Tracker"),
        ),

        ListTile(
          leading: Icon(Icons.headphones),
          title: Text("Audio Messages"),
        ),

        ListTile(
          leading: Icon(Icons.quiz),
          title: Text("Quiz"),
        ),

        ListTile(
          leading: Icon(Icons.contact_mail),
          title: Text("Contact Us"),
        ),

        ListTile(
          leading: Icon(Icons.info),
          title: Text("About Us"),
        ),

        ListTile(
          leading: Icon(Icons.share),
          title: Text("Share App"),
        ),

      ],
    ),
  ),

  body: index == 0 ? dashboard() : pages[index],

  bottomNavigationBar: BottomNavigationBar(
    currentIndex: index,
    type: BottomNavigationBarType.fixed,

    onTap: (i){
      setState(() {
        index = i;
      });
    },

    items: const [

      BottomNavigationBarItem(
        icon: Icon(Icons.menu_book),
        label: "Bible",
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.music_note),
        label: "Songs",
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.book),
        label: "Books",
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.live_tv),
        label: "Live",
      ),

    ],
  ),
);

}

Widget dashboard() {

return ListView(
  padding: const EdgeInsets.all(16),
  children: [

    Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff3a7bd5), Color(0xff00d2ff)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),

      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Verse of the Day",
            style: TextStyle(color: Colors.white70),
          ),

          SizedBox(height: 10),

          Text(
            "For God so loved the world that he gave his one and only Son.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),

          SizedBox(height: 8),

          Text(
            "John 3:16",
            style: TextStyle(color: Colors.white70),
          ),

        ],
      ),
    ),

    const SizedBox(height: 25),

    const Text(
      "Daily Updates",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    const SizedBox(height: 10),

    const ListTile(
      leading: Icon(Icons.notifications),
      title: Text("Today's devotion available"),
      subtitle: Text("Tap to read today's message"),
    ),

    const ListTile(
      leading: Icon(Icons.notifications),
      title: Text("New sermon uploaded"),
      subtitle: Text("Listen to today's audio message"),
    ),

    const SizedBox(height: 25),

    const Text(
      "Ministry",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    const SizedBox(height: 10),

    const ListTile(
      leading: Icon(Icons.headphones),
      title: Text("Audio Messages"),
    ),

    const ListTile(
      leading: Icon(Icons.quiz),
      title: Text("Quiz"),
    ),

    const ListTile(
      leading: Icon(Icons.track_changes),
      title: Text("Tracker"),
    ),

  ],
);

}
}