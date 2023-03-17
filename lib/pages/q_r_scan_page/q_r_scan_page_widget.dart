import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../flutter_flow/flutter_flow_widgets.dart';
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
      var res = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SimpleBarcodeScannerPage(
              appBarTitle: 'Scan QR Code',
              scanType: ScanType.qr,
            ),
          ));
      setData(res);
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  setData(res) {
    print("setData");
    setState(() {
      if (res is String) {
        _model.textQR = res;
        if (_model.textQR == '') {
          _model.status = 'failed';
          _model.textStatus = 'ไม่พบข้อมูลกรุณาลองอีกครั้ง';
        } else {

          //เช็ครูปแบบ QR Code


          _model.status = 'success';
          _model.textStatus = 'บันทึกข้อมูลเรียบร้อยแล้ว';



        }
      }
    });
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
                  if (_model.status == "success")
                    Icon(
                      Icons.check_circle,
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      size: 128.0,
                    ),
                  if (_model.status == "failed")
                    Icon(
                      Icons.cancel_sharp,
                      color: Color(0xFFD83333),
                      size: 128.0,
                    ),
                ],
              ),
              Text(
                _model.textStatus,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Kanit',
                      fontSize: 24.0,
                    ),
              ),
              if (_model.status != "")
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.safePop();
                  },
                  text: 'กลับ',
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Kanit',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
