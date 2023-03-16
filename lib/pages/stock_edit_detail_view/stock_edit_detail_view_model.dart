import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StockEditDetailViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for trackingCode widget.
  TextEditingController? trackingCodeController;
  String? Function(BuildContext, String?)? trackingCodeControllerValidator;
  // State field(s) for roomNo widget.
  final roomNoKey = GlobalKey();
  TextEditingController? roomNoController;
  String? roomNoSelectedOption;
  String? Function(BuildContext, String?)? roomNoControllerValidator;
  // State field(s) for receiveName widget.
  final receiveNameKey = GlobalKey();
  TextEditingController? receiveNameController;
  String? receiveNameSelectedOption;
  String? Function(BuildContext, String?)? receiveNameControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    trackingCodeController?.dispose();
  }

  /// Additional helper methods are added here.

}
