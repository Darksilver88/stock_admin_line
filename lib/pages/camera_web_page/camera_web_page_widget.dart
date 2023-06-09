import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../util/UpperCaseTextFormatter.dart';
import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
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

  //camera
  late CameraController controller;
  XFile? imageFile;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraWebPageModel());

    _model.stockCodeController ??= TextEditingController();
    _model.dummyNameController ??= TextEditingController();
    _model.remarkController ??= TextEditingController();

    //camera
    controller = CameraController(FFAppState().cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();

    //camera
    controller.dispose();
    super.dispose();
  }

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }

  void _logError(String code, String? message) {
    // ignore: avoid_print
    print('Error: $code${message == null ? '' : '\nError Message: $message'}');
  }

  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) {
      if (mounted) {
        setState(() {
          imageFile = file;
        });
        if (file != null) {
          /*showInSnackBar('Picture saved to ${file.path}');
          print("imageFile : done");
          print(imageFile);*/
          controller.dispose();
          setState(() {});
        }
      }
    });
  }

  /// Display the control bar with buttons to take pictures and record videos.
  Widget _captureControlRowWidget() {
    final CameraController? cameraController = controller;
    return GestureDetector(
      onTap: cameraController != null && cameraController.value.isInitialized && !cameraController.value.isRecordingVideo ? onTakePictureButtonPressed : null,
      child: Material(
        color: Colors.transparent,
        elevation: 3,
        shape: const CircleBorder(),
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.photo_camera,
                color: FlutterFlowTheme.of(context).secondary,
                size: 36,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Display the thumbnail of the captured image or video.
  Widget _thumbnailWidget() {
    return (imageFile == null)
        ? Container()
        : SizedBox(
            width: 250,
            height: 250,
            child: kIsWeb
                ? Image.network(
                    imageFile!.path,
                    width: 250,
                  )
                : Image.file(
                    File(imageFile!.path),
                    width: 250,
                  ));
  }

  Future<String> uploadFile(Uint8List image, String storagePath, String name) async {
    print("[[uploadFile]]");
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child(storagePath).child('/$name.jpg');
    final metadata = firebase_storage.SettableMetadata(contentType: 'image/jpeg');
    await ref.putData(image, metadata);
    return ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (imageFile != null)
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Material(
                  color: Colors.transparent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 64, 0, 0),
                            child: Text(
                              'ยืนยันข้อมูลผู้รับแทน',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Kanit',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [_thumbnailWidget()],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
                            child: TextFormField(
                                controller: _model.stockCodeController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'หมายเลขพัสดุ (ตัวอย่าง A000001)',
                                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).lineColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).lineColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.stockCodeControllerValidator.asValidator(context),
                                inputFormatters: [
                                  UpperCaseTextFormatter(),
                                ]),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: TextFormField(
                              controller: _model.dummyNameController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'ชื่อผู้รับแทน',
                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).lineColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.dummyNameControllerValidator.asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: TextFormField(
                              controller: _model.remarkController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'หมายเหตุ (หากมี)',
                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).lineColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).lineColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Kanit',
                                    lineHeight: 3,
                                  ),
                              validator: _model.remarkControllerValidator.asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 32, 6, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.safePop();
                                  },
                                  text: 'ย้อนกลับ',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    color: Color(0xFFD83333),
                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                          fontFamily: 'Kanit',
                                          color: Colors.white,
                                        ),
                                    elevation: 2,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate()) {
                                      return;
                                    }

                                    _model.stockReference = await actions.getStockReference(
                                      _model.stockCodeController.text,
                                    );

                                    _shouldSetState = true;
                                    if (_model.stockReference != null) {
                                      EasyLoading.show(
                                        status: 'loading...',
                                        maskType: EasyLoadingMaskType.black,
                                      );

                                      // uploadPhoto
                                      DateTime now = DateTime.now();
                                      String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

                                      var url = await uploadFile(
                                          await functions.addWaterMark(imageFile), "kconnect/stock/${FFAppState().customerName}/", "$formattedDate-${DateTime.now().millisecondsSinceEpoch}");

                                      final stockListUpdateData = createStockListRecordData(
                                          updateDate: getCurrentTimestamp,
                                          updateBy: FFAppState().currentAdminMember,
                                          status: 3,
                                          remark: _model.remarkController.text,
                                          dummyName: _model.dummyNameController.text,
                                          dummyPhoto: url);
                                      await _model.stockReference!.update(stockListUpdateData);
                                      EasyLoading.dismiss();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'บันทึกข้อมูลเรียบร้อยแล้ว',
                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                  fontFamily: 'Kanit',
                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                ),
                                          ),
                                          duration: Duration(milliseconds: 2000),
                                          backgroundColor: FlutterFlowTheme.of(context).success,
                                        ),
                                      );
                                      context.safePop();
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'ขออภัยไม่พบหมายเลขพัสดุนี้ในระบบ',
                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                  fontFamily: 'Kanit',
                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                ),
                                          ),
                                          duration: Duration(milliseconds: 2000),
                                          backgroundColor: FlutterFlowTheme.of(context).error,
                                        ),
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    if (_shouldSetState) setState(() {});
                                  },
                                  text: 'บันทึก',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                          fontFamily: 'Kanit',
                                          color: Colors.white,
                                        ),
                                    elevation: 2,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

    return Column(
      children: [
        Expanded(child: CameraPreview(controller)),
        Container(
          height: 80,
          child: _captureControlRowWidget(),
        )
      ],
    );
  }
}
