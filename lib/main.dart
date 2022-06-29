import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

Future<Album> fetchAlbum() async {
  var headers = {
    'accept': 'application/json',
    'api-secret': 'Thisisnotadrill',
    'access-control-allow-origin': '*',
  };

  var params = {
    'token': 'mycgm-4eed72c0613bed6d',
  };

  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');
  var url = Uri.parse(
      'https://stucgm.herokuapp.com/api/v1/entries/current.json?$query');
  var res = await http.get(url, headers: headers);

  if (res.statusCode == 200) {
    return Album.fromJson((jsonDecode(res.body) as List)[0]);
  } else {
    throw Exception('Failed to load glucose data');
  }
}

class Album {
  final String direction;
  final int sgv;
  final double mmol;

  const Album({required this.direction, required this.sgv, required this.mmol});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      sgv: json['sgv'],
      direction: json['direction'],
      mmol: 1.0,
    );
  }
}

class MyCardItem extends StatelessWidget {
  String title;
  String description;
  String timeCode;
  IconData iconData;

  MyCardItem(this.title, this.description, this.iconData, this.timeCode);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.blue.withOpacity(0.2),
              elevation: 3,
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: Colors.black)),
                  Text(
                    description,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Icon(iconData, size: 30, color: Colors.blueGrey.shade900),
                      Text(
                        timeCode,
                        style: TextStyle(color: Colors.blueGrey.shade900),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My CGM',
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      home: Center(
        child: Scaffold(
          body: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                double mmol = (snapshot.data!.sgv / 18);
                return MyCardItem("Your blood glucose is", "${mmol.toStringAsPrecision(2)} mmol/L",
                    Icons.done, "${snapshot.data!.direction} as of x minutes ago");
                // return Card(
                //   elevation: 0,
                //   color: Theme.of(context).colorScheme.primary,
                //   child: Center(
                //     child: Container(
                //
                //       alignment: Alignment.centerLeft,
                //       child: Row(
                //
                //
                //         children: [
                //           Text(
                //
                //
                //
                //             'Your blood glucose is\n',
                //             style: TextStyle(
                //               fontSize: 18.0,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.black),
                //           ),
                //
                //
                //
                //         Text(
                //           'x mmol/L\n',
                //           style: TextStyle(
                //               fontSize: 18.0,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.black),
                //         ),
                //
                //           Text(
                //             'as of x minutes ago',
                //             style: TextStyle(
                //                 fontSize: 18.0,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.black),
                //           ),
                //         ],
                //       ),
                //   ),
                //   ),
                // );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
