import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CameraWebPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for stockCode widget.
  TextEditingController? stockCodeController;
  String? Function(BuildContext, String?)? stockCodeControllerValidator;
  String? _stockCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for dummyName widget.
  TextEditingController? dummyNameController;
  String? Function(BuildContext, String?)? dummyNameControllerValidator;
  String? _dummyNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for remark widget.
  TextEditingController? remarkController;
  String? Function(BuildContext, String?)? remarkControllerValidator;
  // Stores action output result for [Custom Action - getStockReference] action in Button widget.
  DocumentReference? stockReference;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    stockCodeControllerValidator = _stockCodeControllerValidator;
    dummyNameControllerValidator = _dummyNameControllerValidator;
  }

  void dispose() {
    stockCodeController?.dispose();
    dummyNameController?.dispose();
    remarkController?.dispose();
  }

  /// Additional helper methods are added here.

}
