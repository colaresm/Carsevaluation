import 'dart:async';
import 'dart:convert';
import 'package:carsavaliation/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String title;

  const Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() {
  runApp(const Avaliation());
}

class Avaliation extends StatefulWidget {
  const Avaliation({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<Avaliation> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    changeView(index);
  }

  void changeView(index) {
    _selectedIndex = index;
    setState(() {
      switch (index) {
        case 0:
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
            break;
          }
        case 1:
          {
            break;
          }
      }
    });
  }

  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;

  String dropdownValue = 'rwd';
  String dropdownValuefuel = 'mpfi';
  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Cars Evaluation',
                    style: GoogleFonts.acme(),
                  ),
                )
              ],
            )),
        body: SingleChildScrollView(
            child: Center(
                child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(4),
              ),
              DropdownButtonFormField<String>(
                value: dropdownValue,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    icon: const Icon(Icons.book)),
                validator: (value) {
                  if (value == null) {
                    return 'Selecione o tipo de volante';
                  }
                },
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['rwd', 'fwd', '4wd']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
              ),
              TextFormField(
                onChanged: (val) {
                  // livro.autor = val;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert value of wheelbase';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "wheelbase",
                    labelStyle: TextStyle(color: Colors.black),
                    icon: Icon(Icons.book)),
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              TextFormField(
                onChanged: (val) {
                  // livro.autor = val;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert value of carwidth';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "carwidth",
                    labelStyle: TextStyle(color: Colors.black),
                    icon: Icon(Icons.book)),
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              TextFormField(
                onChanged: (val) {
                  // livro.autor = val;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert value of carheight';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "carheight",
                    labelStyle: TextStyle(color: Colors.black),
                    icon: Icon(Icons.book)),
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              TextFormField(
                onChanged: (val) {
                  // livro.autor = val;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert value of curbweight';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "curbweight",
                    labelStyle: TextStyle(color: Colors.black),
                    icon: Icon(Icons.book)),
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              TextFormField(
                onChanged: (val) {
                  // livro.autor = val;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert value of enginesize';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "enginesize",
                    labelStyle: TextStyle(color: Colors.black),
                    icon: Icon(Icons.book)),
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              DropdownButtonFormField<String>(
                value: dropdownValuefuel,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    icon: const Icon(Icons.book)),
                validator: (value) {
                  if (value == null) {
                    return 'insert into value of fuelsystem';
                  }
                },
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValuefuel = newValue!;
                  });
                },
                items: <String>[
                  'mpfi',
                  '2bbl',
                  'mfi',
                  '1bbl',
                  'spfi',
                  '4bbl',
                  'idi',
                  'spdi'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              TextFormField(
                onChanged: (val) {
                  // livro.autor = val;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert value of boreratio';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "boreratio",
                    labelStyle: TextStyle(color: Colors.black),
                    icon: Icon(Icons.book)),
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              TextFormField(
                onChanged: (val) {
                  // livro.autor = val;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert value of horsepower';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "horsepower",
                    labelStyle: TextStyle(color: Colors.black),
                    icon: Icon(Icons.book)),
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              TextFormField(
                onChanged: (val) {
                  // livro.autor = val;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert value of citympg';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "citympg",
                    labelStyle: TextStyle(color: Colors.black),
                    icon: Icon(Icons.book)),
              ),
              TextFormField(
                onChanged: (val) {
                  // livro.autor = val;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert value of highwaympg';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: "highwaympg",
                    labelStyle: TextStyle(color: Colors.black),
                    icon: Icon(Icons.book)),
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              const Text(
                'Predicted price: 4000',
                style: TextStyle(height: 5, fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber, // background
                    onPrimary: Colors.black, // foreground
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Avaliação feita com sucesso.')),
                      );

                      //  salvareditora();
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => MyApp()));
                    }
                  },
                  child: const Text('Save review'),
                ),
              )
            ],
          ),
        ))),
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
          currentIndex: 1,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
