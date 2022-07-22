import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  // @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();

  }

  // @override
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
        floatingActionButton: ExampleExpandableFab(),

          body: FutureBuilder<Album>(

            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                double mmol = (snapshot.data!.sgv / 18);
                var dateMmol = DateTime.parse(snapshot.data!.dateString);
                var howRecent = DateTime.now().difference(dateMmol);
                var inMinutes = howRecent.inMinutes;

                return
               MyCardItem(
                                    "Your blood glucose is",
                                    "${mmol.toStringAsPrecision(2)} mmol/L",
                                    Icons.arrow_right_alt,
                                    "as of $inMinutes minutes ago");
                              // );
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
        // ),
      // ),

  }
}




// Make the GET request and store it as var res
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
  final num delta;

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
  num delta=15;

  MyCardItem(this.title, this.description, this.iconData, this.timeCode);



  // @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
         color: Theme.of(context).colorScheme.primary,
          elevation: 3,
          margin: const EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(title),
                Text(
                  description,
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    Transform.rotate(
                        angle: this.delta.toDouble(), child: Icon(iconData, size: 30, color: Colors.blueGrey.shade700 ),),
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



//BELOW IS THE FAB



// @immutable
class ExampleExpandableFab extends StatelessWidget {
  static const _actionTitles = ['Add Optisulin', 'Add NovoRapid'];

  const ExampleExpandableFab({super.key});

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(_actionTitles[index]),
          content: TextField(
          //         controller: _controller,
            focusNode: FocusNode(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Value',
                hintText: 'Enter the units administered'),
            autofocus: true,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('SEND'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Add Insultin FAB'),
      // ),
      // body:
      // ListView.builder(
      //   padding: const EdgeInsets.symmetric(vertical: 8.0),
      //   itemCount: 25,
      //   itemBuilder: (context, index) {
      //     return FakeItem(isBig: index.isOdd);
      //   },
      // ),
      floatingActionButton: ExpandableFab(
        distance: 75.0,
        children: [
          ActionButton(
            onPressed: () => _showAction(context, 0),
            icon: const Icon(Icons.browse_gallery),
          ),
          ActionButton(
            onPressed: () => _showAction(context, 1),
            icon: const Icon(Icons.query_builder),
          ),
        ],
      ),
    );
  }
}

// @immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
  });

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  // @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  // @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  // @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
    i < count;
    i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            onPressed: _toggle,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

// @immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.secondary,
      elevation: 4.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: theme.colorScheme.onSecondary,
      ),
    );
  }
}

// @immutable
// class FakeItem extends StatelessWidget {
//   const FakeItem({
//     super.key,
//     required this.isBig,
//   });
//
//   final bool isBig;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
//       height: isBig ? 128.0 : 36.0,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(8.0)),
//         color: Colors.grey.shade300,
//       ),
//     );
//   }
// }

