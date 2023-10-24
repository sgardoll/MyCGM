import '/components/scaned_item_details/scaned_item_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_to_details_model.dart';
export 'nav_to_details_model.dart';

class NavToDetailsWidget extends StatefulWidget {
  const NavToDetailsWidget({
    Key? key,
    required this.docRef,
    required this.input,
  }) : super(key: key);

  final DocumentReference? docRef;
  final String? input;

  @override
  _NavToDetailsWidgetState createState() => _NavToDetailsWidgetState();
}

class _NavToDetailsWidgetState extends State<NavToDetailsWidget> {
  late NavToDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavToDetailsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Navigator.pop(context);
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        useSafeArea: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.viewInsetsOf(context),
            child: ScanedItemDetailsWidget(
              docRef: widget.docRef,
              input: widget.input!,
            ),
          );
        },
      ).then((value) => safeSetState(() {}));
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container();
  }
}
