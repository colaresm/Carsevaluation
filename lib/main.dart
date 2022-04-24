import 'package:flutter/material.dart';
import 'avaliationView/AvaliationView.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    changeView(index);
  }

  void changeView(index) {
    _selectedIndex = index;
    setState(() {
      switch (index) {
        case 0:
          {
            break;
          }
        case 1:
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Avaliation()));
            break;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber[400],
          title: Row(
            children: [
              Image.asset(
                'SeekPng.com_car-png-icon_1131138.png',
                fit: BoxFit.contain,
                height: 80,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Cars Evaluation',
                  style: GoogleFonts.acme(),
                ),
              )
            ],
          )),
      body: Column(
        children: const <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: "Buscar",
                labelStyle: TextStyle(color: Colors.black),
                icon: Icon(Icons.search)),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Avaliar',
            backgroundColor: Colors.amber,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
