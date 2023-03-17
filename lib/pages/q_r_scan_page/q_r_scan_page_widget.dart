import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'q_r_scan_page_model.dart';
export 'q_r_scan_page_model.dart';

class QRScanPageWidget extends StatefulWidget {
  const QRScanPageWidget({Key? key}) : super(key: key);

  @override
  _QRScanPageWidgetState createState() => _QRScanPageWidgetState();
}

class _QRScanPageWidgetState extends State<QRScanPageWidget> {
  late QRScanPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QRScanPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.qRText = await FlutterBarcodeScanner.scanBarcode(
        '#C62828', // scanning line color
        'ย้อนกลับ', // cancel button text
        true, // whether to show the flash icon
        ScanMode.QR,
      );
    });
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
