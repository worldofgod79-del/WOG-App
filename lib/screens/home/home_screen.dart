import 'package:flutter/material.dart';
import '../bible/bible_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int index = 0;

  final pages = const [

    HomePage(),
    BibleScreen(),
    SongsPage(),
    LivePage(),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[index],

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: index,

        onTap: (value) {

          setState(() {
            index = value;
          });

        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Bible",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: "Songs",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            label: "Live",
          ),

        ],

      ),

    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                color: Colors.blue,
              ),

              child: Text(
                "World Of God",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),

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
              leading: Icon(Icons.track_changes),
              title: Text("Tracker"),
            ),

          ],

        ),

      ),

      body: const Center(
        child: Text(
          "Welcome to WOG App",
          style: TextStyle(fontSize: 20),
        ),
      ),

    );
  }
}

class SongsPage extends StatelessWidget {
  const SongsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Songs Section"),
    );
  }
}

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Live Section"),
    );
  }
}
