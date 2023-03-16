import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'stock_edit_detail_view_model.dart';
export 'stock_edit_detail_view_model.dart';

class StockEditDetailViewWidget extends StatefulWidget {
  const StockEditDetailViewWidget({
    Key? key,
    this.stockParameter,
  }) : super(key: key);

  final StockListRecord? stockParameter;

  @override
  _StockEditDetailViewWidgetState createState() => _StockEditDetailViewWidgetState();
}

class _StockEditDetailViewWidgetState extends State<StockEditDetailViewWidget> {
  late StockEditDetailViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StockEditDetailViewModel());

    _model.trackingCodeController ??= TextEditingController(text: widget.stockParameter!.trackingCode);
    _model.roomNoController ??= TextEditingController(text: widget.stockParameter!.roomNo);
    _model.receiveNameController ??= TextEditingController(text: widget.stockParameter!.receiveName);
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: FutureBuilder<List<MemberRecord>>(
              future: queryMemberRecordOnce(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                  );
                }
                List<MemberRecord> containerMemberRecordList = snapshot.data!;
                return Material(
                  color: Colors.transparent,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    width: double.infinity,
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
                            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  widget.stockParameter!.code!,
                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Kanit',
                                        fontSize: 32,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: TextFormField(
                              controller: _model.trackingCodeController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'รหัสติดตามพัสดุ',
                                hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
                              style: FlutterFlowTheme.of(context).bodyText1,
                              validator: _model.trackingCodeControllerValidator.asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: Autocomplete<String>(
                              initialValue: TextEditingValue(text: widget.stockParameter!.roomNo!),
                              optionsBuilder: (textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                return containerMemberRecordList.map((e) => e.roomNo).withoutNulls.toList().toList().where((option) {
                                  final lowercaseOption = option.toLowerCase();
                                  return lowercaseOption.contains(textEditingValue.text.toLowerCase());
                                });
                              },
                              optionsViewBuilder: (context, onSelected, options) {
                                return AutocompleteOptionsList(
                                  textFieldKey: _model.roomNoKey,
                                  textController: _model.roomNoController!,
                                  options: options.toList(),
                                  onSelected: onSelected,
                                  textStyle: FlutterFlowTheme.of(context).bodyText1,
                                  textHighlightStyle: TextStyle(),
                                  elevation: 4,
                                  optionBackgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                  optionHighlightColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  maxHeight: 200,
                                );
                              },
                              onSelected: (String selection) {
                                setState(() => _model.roomNoSelectedOption = selection);
                                FocusScope.of(context).unfocus();
                              },
                              fieldViewBuilder: (
                                context,
                                textEditingController,
                                focusNode,
                                onEditingComplete,
                              ) {
                                _model.roomNoController = textEditingController;
                                return TextFormField(
                                  key: _model.roomNoKey,
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onEditingComplete: onEditingComplete,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'ห้องเลขที่',
                                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  validator: _model.roomNoControllerValidator.asValidator(context),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: Autocomplete<String>(
                              initialValue: TextEditingValue(text: widget.stockParameter!.receiveName!),
                              optionsBuilder: (textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                return containerMemberRecordList.map((e) => e.fullName).withoutNulls.toList().toList().where((option) {
                                  final lowercaseOption = option.toLowerCase();
                                  return lowercaseOption.contains(textEditingValue.text.toLowerCase());
                                });
                              },
                              optionsViewBuilder: (context, onSelected, options) {
                                return AutocompleteOptionsList(
                                  textFieldKey: _model.receiveNameKey,
                                  textController: _model.receiveNameController!,
                                  options: options.toList(),
                                  onSelected: onSelected,
                                  textStyle: FlutterFlowTheme.of(context).bodyText1,
                                  textHighlightStyle: TextStyle(),
                                  elevation: 4,
                                  optionBackgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                  optionHighlightColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  maxHeight: 200,
                                );
                              },
                              onSelected: (String selection) {
                                setState(() => _model.receiveNameSelectedOption = selection);
                                FocusScope.of(context).unfocus();
                              },
                              fieldViewBuilder: (
                                context,
                                textEditingController,
                                focusNode,
                                onEditingComplete,
                              ) {
                                _model.receiveNameController = textEditingController;
                                return TextFormField(
                                  key: _model.receiveNameKey,
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onEditingComplete: onEditingComplete,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'ชื่อผู้รับ',
                                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  validator: _model.receiveNameControllerValidator.asValidator(context),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 6, 0),
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
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    _model.isMemberExit = await actions.checkMemberIsExit(
                                      _model.roomNoController.text,
                                      _model.receiveNameController.text,
                                    );
                                    _shouldSetState = true;
                                    if (_model.isMemberExit != null) {
                                      final stockListUpdateData = createStockListRecordData(
                                        updateDate: getCurrentTimestamp,
                                        receiveName: _model.receiveNameController.text,
                                        trackingCode: _model.trackingCodeController.text,
                                        roomNo: _model.roomNoController.text,
                                        memberRef: _model.isMemberExit,
                                      );
                                      await widget.stockParameter!.reference.update(stockListUpdateData);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'บันทึกข้อมูลเรียบร้อยแล้ว',
                                            style: FlutterFlowTheme.of(context).subtitle1.override(
                                                  fontFamily: 'Kanit',
                                                  color: Colors.white,
                                                ),
                                          ),
                                          duration: Duration(milliseconds: 4000),
                                          backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
                                        ),
                                      );
                                      context.safePop();
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'ขออภัยไม่มีลูกบ้านนี้ในระบบ',
                                            style: FlutterFlowTheme.of(context).subtitle1.override(
                                                  fontFamily: 'Kanit',
                                                  color: Colors.white,
                                                ),
                                          ),
                                          duration: Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFFE98A15),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
