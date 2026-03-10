import 'package:flutter/material.dart';

void main() {
  runApp(WOGApp());
}

class WOGApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WOG App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;

  final pages = [
    Center(child: Text("Full Bible")),
    Center(child: Text("Songs")),
    Center(child: Text("Books")),
    Center(child: Text("Live")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WOG App"),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(child: Text("WOG APP")),
            ),
            ListTile(title: Text("Tracker")),
            ListTile(title: Text("Audio Messages")),
            ListTile(title: Text("Quiz")),
            ListTile(title: Text("Contact Us")),
            ListTile(title: Text("About Us")),
            ListTile(title: Text("Share App")),
          ],
        ),
      ),

      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: "Bible"),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label: "Songs"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Books"),
          BottomNavigationBarItem(
              icon: Icon(Icons.live_tv),
              label: "Live"),
        ],
      ),
    );
  }
}
