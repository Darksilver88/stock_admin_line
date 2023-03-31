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

  showStatus(status, textStatus) {
    setState(() {
      _model.status = status;
      _model.textStatus = textStatus;
    });
  }

  setData(res) async {
    print("setData");
    if (res is String) {
      _model.textQR = res;
      print(_model.textQR);
      if (_model.textQR == '') {
        showStatus('failed', 'ไม่พบข้อมูลกรุณาลองอีกครั้ง');
        return;
      }

      //เช็ครูปแบบ QR Code
      if (_model.textQR.contains('stock_')) {
        if (_model.textQR.split('_').length != 3) {
          print("case b");
          showStatus('failed', 'ไม่พบข้อมูลกรุณาลองอีกครั้ง');
          return;
        }

        var rsMember = await FirebaseFirestore.instance.doc(_model.textQR.split('_')[2]).get();
        if (!rsMember.exists) {
          print("case c");
          showStatus('failed', 'ไม่พบข้อมูลกรุณาลองอีกครั้ง');
          return;
        }

        var tmpStock = _model.textQR.split('_')[2].split('/');
        var stockPath = tmpStock[0] + '/' + tmpStock[1] + '/stock/data/stock_list';
        var rsStock = await FirebaseFirestore.instance.collection(stockPath).where('code', isEqualTo: _model.textQR.split('_')[1]).get();
        if (rsStock.docs.isEmpty) {
          print("case d");
          showStatus('failed', 'ไม่พบข้อมูลกรุณาลองอีกครั้ง');
          return;
        }

        if (rsStock.docs[0].data()["status"] == 3) {
          print("case e");
          showStatus('warning', 'พัสดุชิ้นนี้ถูกจ่ายไปแล้ว');
          return;
        }

        //เปลี่ยนสถานะ
        print(rsStock.docs[0].reference.path);
        FirebaseFirestore.instance.doc(rsStock.docs[0].reference.path).update({
          'status': 3,
          'update_by': FFAppState().currentAdminMember,
          'update_date': getCurrentTimestamp,
        });
        showStatus('success', 'บันทึกข้อมูลเรียบร้อยแล้ว');
        return;
      } else if (_model.textQR.contains('member_')) {
        if (_model.textQR.split('_').length != 2) {
          print("case b1");
          showStatus('failed', 'ไม่พบข้อมูลกรุณาลองอีกครั้ง');
          return;
        }

        // ดึงข้อมูล
        var tmpMember = _model.textQR.split('_');
        var memberResult = await FirebaseFirestore.instance.doc(tmpMember[1]).get();

        // ถ้าเคยสแกนแล้ว
        if (memberResult.data()!["status"] == 1) {
          print("case b2");
          showStatus('success', 'ยืนยันข้อมูลเรียบร้อยแล้ว');
          return;
        }

        // แสดงข้อมูลให้นิติเห็นก่อน
        showStatus('info', '');
        return;

        // ไปสร้างข้อมูลใน kconnect/(customerของตัวแอดมินที่เป็นคนสแกน)/
        /*FirebaseFirestore.instance.collection('kconnect/${FFAppState().customerName}/member').add({
          'roomNo': memberResult.data()!["roomNo"],
          'prefixName': memberResult.data()!["prefixName"],
          'firstName': memberResult.data()!["firstName"],
          'lastName': memberResult.data()!["lastName"],
          'fullName': memberResult.data()!["fullName"],
          'userRole': 'ลูกบ้าน',
          'status': 1,
          'create_by': FFAppState().currentAdminMember,
          'create_date': getCurrentTimestamp,
        }).then((value) {

          //เพิ่ม k-connect-activate ไว้เข้าครั้งถัดไป
          FirebaseFirestore.instance.collection('kconnect/${FFAppState().customerName}/k-connect-activate').doc(value.id).set({
            'id': value.id,
            'activateDate': getCurrentTimestamp,
            'isActivate': true,
          });

          // เปลี่ยนสถานะ
          FirebaseFirestore.instance.doc(tmpMember[1]).update({
            'status': 1,
            'update_by': FFAppState().currentAdminMember,
            'update_date': getCurrentTimestamp,
            'customerPath': value.path,
          });
        });

        showStatus('success', 'ยืนยันข้อมูลเรียบร้อยแล้ว');
        return;
         */
      }

      showStatus('failed', 'ไม่พบข้อมูลกรุณาลองอีกครั้ง');
      return;
    }
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
                  if (_model.status == "warning")
                    Icon(
                      Icons.info,
                      color: Color(0xFFF58800),
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
