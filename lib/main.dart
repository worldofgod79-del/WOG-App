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
      theme: ThemeData(primarySwatch: Colors.blue),
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

  int index = 0;

  final pages = [
    const Center(child: Text("Full Bible")),
    const Center(child: Text("Songs")),
    const Center(child: Text("Books")),
    const Center(child: Text("Live")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WOG App")),

      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text("World Of God")),
            ListTile(title: Text("Tracker")),
            ListTile(title: Text("Audio Messages")),
            ListTile(title: Text("Quiz")),
            ListTile(title: Text("Contact Us")),
            ListTile(title: Text("About Us")),
            ListTile(title: Text("Share App")),
          ],
        ),
      ),

      body: pages[index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i){
          setState(() {
            index = i;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Bible"),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: "Songs"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Books"),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: "Live"),
        ],
      ),
    );
  }
}
