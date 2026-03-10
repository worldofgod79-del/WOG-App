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
return SingleChildScrollView(
child: Column(
children: [

      Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff3a7bd5), Color(0xff00d2ff)],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [

            Text(
              "Welcome",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),

            SizedBox(height: 5),

            Text(
              "WOG App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),

      const SizedBox(height: 20),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
              )
            ],
          ),

          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "Verse of the Day",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "For God so loved the world that he gave his one and only Son.",
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 5),

              Text(
                "John 3:16",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
        ),
      ),

      const SizedBox(height: 20),

      Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(

          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,

          children: [

            feature(Icons.menu_book, "Bible", Colors.blue),

            feature(Icons.music_note, "Songs", Colors.orange),

            feature(Icons.book, "Books", Colors.green),

            feature(Icons.live_tv, "Live", Colors.red),

          ],
        ),
      ),

    ],
  ),
);

}

Widget feature(IconData icon, String title, Color color) {

return Container(

  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(20),
  ),

  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      Icon(icon, size: 50, color: Colors.white),

      const SizedBox(height: 10),

      Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      )

    ],
  ),
);

}
}
