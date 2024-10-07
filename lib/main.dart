import 'package:flutter/material.dart';
import 'pie_chart_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pie Chart App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    PieChartPage(),
    Center(child: Text("Page 2", style: TextStyle(fontSize: 24))),
    Center(child: Text("Page 3", style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart App'),
      ),
      body: Row(
        children: [
          // Vertical Navigation Bar
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.pie_chart),
                label: Text('Pie Chart'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.pageview),
                label: Text('Page 2'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.pageview),
                label: Text('Page 3'),
              ),
            ],
          ),
          // Main Content
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                // Info button action
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Info'),
                    content: Text('This is a Pie Chart App.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
            Text('Powered by Flutter', style: TextStyle(color: Colors.grey)),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Settings button action
              },
            ),
          ],
        ),
      ),
    );
  }
}
