import 'package:camera/camera.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'stock_type_out_page_model.dart';
export 'stock_type_out_page_model.dart';

late List<CameraDescription> _cameras;

class StockTypeOutPageWidget extends StatefulWidget {
  const StockTypeOutPageWidget({Key? key}) : super(key: key);

  @override
  _StockTypeOutPageWidgetState createState() => _StockTypeOutPageWidgetState();
}

class _StockTypeOutPageWidgetState extends State<StockTypeOutPageWidget> {
  late StockTypeOutPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StockTypeOutPageModel());
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
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Text(
                    'เลือกวิธีจ่ายพัสดุ',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Kanit',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                child: InkWell(
                  onTap: () async {
                    context.pushNamed('QRScanPage');
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.qr_code_rounded,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 84,
                          ),
                          Text(
                            'สแกน QR Code',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Kanit',
                                  fontSize: 22,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () async {
                        // await Future.delayed(const Duration(milliseconds: 1000));
                        _cameras = await availableCameras();
                        FFAppState().cameras = _cameras;
                        context.pushNamed('CameraWebPage');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo_camera,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 84,
                          ),
                          Text(
                            'ถ่ายรูป',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Kanit',
                                  fontSize: 22,
                                ),
                          ),
                          Text(
                            '(กรณีเป็นผู้รับพัสดุแทน)',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Kanit',
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                ),
                          ),
                        ],
                      ),
                    ),
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
