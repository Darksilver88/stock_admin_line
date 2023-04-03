import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'camera_web_page_model.dart';
export 'camera_web_page_model.dart';

class CameraWebPageWidget extends StatefulWidget {
  const CameraWebPageWidget({Key? key}) : super(key: key);

  @override
  _CameraWebPageWidgetState createState() => _CameraWebPageWidgetState();
}

class _CameraWebPageWidgetState extends State<CameraWebPageWidget> {
  late CameraWebPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraWebPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
    );
  }
}
