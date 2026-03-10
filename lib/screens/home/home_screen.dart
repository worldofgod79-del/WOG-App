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
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "World Of God",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.count(

        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,

        children: [

          card(Icons.menu_book, "Bible", Colors.blue),

          card(Icons.music_note, "Songs", Colors.orange),

          card(Icons.book, "Books", Colors.green),

          card(Icons.live_tv, "Live", Colors.red),

        ],
      ),
    );
  }

  Widget card(IconData icon, String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            icon,
            size: 50,
            color: Colors.white,
          ),

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
