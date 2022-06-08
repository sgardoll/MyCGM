import 'dart:async';
import 'dart:convert';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class _TextStyleItem extends StatelessWidget {
//   const _TextStyleItem({
//     Key? key,
//     required this.name,
//     required this.style,
//     required this.text,
//   }) : super(key: key);
//
//   final String name;
//   final TextStyle style;
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             width: 72,
//             child: Text(name, style: Theme.of(context).textTheme.caption),
//           ),
//           Expanded(
//             child: Text(text, style: style),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
    //return Album.fromJson(jsonDecode(res.body[0]));
    //return Album.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Failed to load glucose data');
  }
  // if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  // return c
}

//   var response = await http.get(
//       Uri.parse('https://stucgm.herokuapp.com/api/v1/entries/sgv?token=mycgm-4eed72c0613bed6d'));
//

class Album {
  final String direction;
  final int sgv;
  final double mmol;

  const Album({required this.direction, required this.sgv, required this.mmol});

  factory Album.fromJson(Map<String, dynamic> json) {
    //factory Album.fromJson(List<dynamic> json) {

    //var j=json;
    //var d=json['direction'];

    return Album(
      sgv: json['sgv'],
      direction: json['direction'],
      mmol: 0.1,
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
      title: 'StuCGM',
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.all(20),
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var mmol = (snapshot.data!.sgv.toDouble()) / 18;

                return Text(
                    mmol.toStringAsFixed(1) + ' ' + snapshot.data!.direction);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
        backgroundColor: Colors.lightBlue[50],
      ),

    );


  }
}
