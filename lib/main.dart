import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
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

  const Album({required this.direction, required this.sgv, required this.mmol});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      sgv: json['sgv'],
      direction: json['direction'],
      mmol: 0.1,
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
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
  home: Scaffold(
  //appBar: AppBar(
 // title: const Text('Fetch Data Example'),
 // ),
  body: Center(
  child: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var mmol = (snapshot.data!.sgv.toDouble()) / 18;
            return Text(
              '${mmol}+${snapshot.data!.direction}');
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),),),);}
  }
