import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
      await Future.delayed(const Duration(milliseconds: 1000));
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    size: 128.0,
                  ),
                  Icon(
                    Icons.cancel_sharp,
                    color: Color(0xFFD83333),
                    size: 128.0,
                  ),
                ],
              ),
              Text(
                'จ่ายพัสดุเรียบร้อยแล้ว',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Kanit',
                      fontSize: 24.0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
