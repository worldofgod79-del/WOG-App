import 'package:flutter/material.dart';

void main() {
  runApp(const WOGApp());
}

class WOGApp extends StatelessWidget {
  const WOGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WOG App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  final List<Widget> pages = const [
    Center(child: Text("Full Bible", style: TextStyle(fontSize: 22))),
    Center(child: Text("Songs", style: TextStyle(fontSize: 22))),
    Center(child: Text("Books", style: TextStyle(fontSize: 22))),
    Center(child: Text("Live", style: TextStyle(fontSize: 22))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WOG App"),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
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

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

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
}
