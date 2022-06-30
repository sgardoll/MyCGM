import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

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
  final String dateString;
  final double delta;

  const Album(
      {required this.direction,
      required this.sgv,
      required this.mmol,
      required this.dateString,
      required this.delta});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      sgv: json['sgv'],
      direction: json['direction'],
      mmol: 1.0,
      dateString: json['dateString'],
      delta: json['delta']
    );
  }
}

class MyCardItem extends StatelessWidget {
  String title;
  String description;
  String timeCode;
  IconData iconData;
  double delta=15;

  MyCardItem(this.title, this.description, this.iconData, this.timeCode);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: Theme.of(context).colorScheme.primary,
          // color: Colors.blue.withOpacity(0.2),
          elevation: 3,
          margin: const EdgeInsets.all(20),
          child: Container(
            padding: new EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(title, style: const TextStyle(color: Colors.black)),
                Text(
                  description,
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    Container(
                      child: Transform.rotate(
                          angle: this.delta, child: Icon(iconData, size: 30, color: Colors.blueGrey.shade700 ),)),
                    Text(
                      timeCode,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.blueGrey.shade900),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
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
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightGreen),
          scaffoldBackgroundColor: Colors.lightGreen.shade100,
        textTheme: GoogleFonts.robotoTextTheme(),
        useMaterial3: true,
        visualDensity: VisualDensity.comfortable,
      ),
      home: Center(
        child: Scaffold(
          body: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                double mmol = (snapshot.data!.sgv / 18);
                var dateMmol = DateTime.parse(snapshot.data!.dateString);

                var howRecent = DateTime.now().difference(dateMmol);
                var inMinutes = howRecent.inMinutes;

                return MyCardItem(
                    "Your blood glucose is",
                    "${mmol.toStringAsPrecision(2)} mmol/L",
                    Icons.arrow_right_alt,
                    "as of ${inMinutes} minutes ago");
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
