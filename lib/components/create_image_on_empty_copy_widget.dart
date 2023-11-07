import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_image_on_empty_copy_model.dart';
export 'create_image_on_empty_copy_model.dart';

class CreateImageOnEmptyCopyWidget extends StatefulWidget {
  const CreateImageOnEmptyCopyWidget({
    Key? key,
    required this.docRef,
  }) : super(key: key);

  final DocumentReference? docRef;

  @override
  _CreateImageOnEmptyCopyWidgetState createState() =>
      _CreateImageOnEmptyCopyWidgetState();
}

class _CreateImageOnEmptyCopyWidgetState
    extends State<CreateImageOnEmptyCopyWidget> {
  late CreateImageOnEmptyCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateImageOnEmptyCopyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.docRef!.update(createFoodDatabaseRecordData(
        buildship: true,
      ));
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
