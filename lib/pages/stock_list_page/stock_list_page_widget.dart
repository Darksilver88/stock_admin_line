import '/backend/backend.dart';
import '/components/no_data_widget.dart';
import '/components/notification_confirm_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'stock_list_page_model.dart';
export 'stock_list_page_model.dart';

class StockListPageWidget extends StatefulWidget {
  const StockListPageWidget({Key? key}) : super(key: key);

  @override
  _StockListPageWidgetState createState() => _StockListPageWidgetState();
}

class _StockListPageWidgetState extends State<StockListPageWidget> {
  late StockListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StockListPageModel());
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
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryColor,
                          labelStyle: FlutterFlowTheme.of(context).subtitle2,
                          indicatorColor: FlutterFlowTheme.of(context).primaryColor,
                          tabs: [
                            Tab(
                              text: 'รอจัดการพัสดุ',
                            ),
                            Tab(
                              text: 'แจ้งลูกบ้านแล้ว',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Stack(
                                children: [
                                  StreamBuilder<List<StockListRecord>>(
                                    stream: queryStockListRecord(
                                      queryBuilder: (stockListRecord) => stockListRecord
                                          .where('status',
                                              isEqualTo: valueOrDefault<int>(
                                                null,
                                                1,
                                              ))
                                          .orderBy('create_date', descending: true),
                                    ),
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
                                      List<StockListRecord> listViewStockListRecordList = snapshot.data!;
                                      if (listViewStockListRecordList.isEmpty) {
                                        return Center(
                                          child: NoDataWidget(),
                                        );
                                      }
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listViewStockListRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewStockListRecord = listViewStockListRecordList[listViewIndex];
                                          return Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'StockEditDetailView',
                                                  queryParams: {
                                                    'stockParameter': serializeParam(
                                                      listViewStockListRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'stockParameter': listViewStockListRecord,
                                                  },
                                                );
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 1,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                    borderRadius: BorderRadius.circular(16),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 16, 12, 16),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Column(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            if (listViewStockListRecord.memberRef != null)
                                                              Theme(
                                                                data: ThemeData(
                                                                  checkboxTheme: CheckboxThemeData(
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(0),
                                                                    ),
                                                                  ),
                                                                  unselectedWidgetColor: Color(0xFFBEC6CF),
                                                                ),
                                                                child: Checkbox(
                                                                  value: _model.checkboxValueMap[listViewStockListRecord] ??= false,
                                                                  onChanged: (newValue) async {
                                                                    setState(() => _model.checkboxValueMap[listViewStockListRecord] = newValue!);
                                                                    if (newValue!) {
                                                                      FFAppState().addToStockChecked(listViewStockListRecord.reference);
                                                                      if (FFAppState().stockChecked.length > 0) {
                                                                        FFAppState().isBottomSheetShow = true;
                                                                        return;
                                                                      } else {
                                                                        FFAppState().isBottomSheetShow = false;
                                                                        return;
                                                                      }
                                                                    } else {
                                                                      FFAppState().removeFromStockChecked(listViewStockListRecord.reference);
                                                                      if (FFAppState().stockChecked.length > 0) {
                                                                        FFAppState().isBottomSheetShow = true;
                                                                        return;
                                                                      } else {
                                                                        FFAppState().isBottomSheetShow = false;
                                                                        return;
                                                                      }
                                                                    }
                                                                  },
                                                                  activeColor: FlutterFlowTheme.of(context).primaryColor,
                                                                ),
                                                              ),
                                                            if (listViewStockListRecord.memberRef == null)
                                                              Icon(
                                                                Icons.edit,
                                                                color: Colors.black,
                                                                size: 24,
                                                              ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                            child: Column(
                                                              mainAxisSize: MainAxisSize.max,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  children: [
                                                                    Expanded(
                                                                      child: Text(
                                                                        listViewStockListRecord.trackingCode!,
                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                              fontFamily: 'Kanit',
                                                                              fontSize: 18,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      listViewStockListRecord.code!,
                                                                      textAlign: TextAlign.end,
                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                            fontFamily: 'Kanit',
                                                                            fontSize: 22,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [
                                                                    RichText(
                                                                      text: TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text: 'ห้อง ',
                                                                            style: TextStyle(
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text: valueOrDefault<String>(
                                                                              listViewStockListRecord.roomNo,
                                                                              '-',
                                                                            ),
                                                                            style: TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 16,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context).bodyText1,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: RichText(
                                                                        text: TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: ' ชื่อผู้รับ ',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                              ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: valueOrDefault<String>(
                                                                                listViewStockListRecord.receiveName,
                                                                                '-',
                                                                              ),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 16,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                fontFamily: 'Kanit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                        ),
                                                                        maxLines: 1,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  if (FFAppState().isBottomSheetShow)
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 1,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                            ),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(16),
                                                topRight: Radius.circular(16),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                                  child: Text(
                                                    'ระบบจะส่งการแจ้งเตือนไปยังลูกบ้าน',
                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                          fontFamily: 'Kanit',
                                                          fontSize: 18,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      print('Button pressed ...');
                                                      print(FFAppState().stockChecked);
                                                    },
                                                    text: 'ตกลง',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
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
                                      ],
                                    ),
                                ],
                              ),
                              StreamBuilder<List<StockListRecord>>(
                                stream: queryStockListRecord(
                                  queryBuilder: (stockListRecord) => stockListRecord
                                      .where('status',
                                          isEqualTo: valueOrDefault<int>(
                                            null,
                                            2,
                                          ))
                                      .orderBy('create_date', descending: true),
                                ),
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
                                  List<StockListRecord> listViewStockListRecordList = snapshot.data!;
                                  if (listViewStockListRecordList.isEmpty) {
                                    return Center(
                                      child: NoDataWidget(),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewStockListRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewStockListRecord = listViewStockListRecordList[listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 1,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(8, 16, 12, 16),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize: MainAxisSize.max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  listViewStockListRecord.trackingCode!,
                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                        fontFamily: 'Kanit',
                                                                        fontSize: 18,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                listViewStockListRecord.code!,
                                                                textAlign: TextAlign.end,
                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                      fontFamily: 'Kanit',
                                                                      fontSize: 22,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize: MainAxisSize.max,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              RichText(
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: 'ห้อง ',
                                                                      style: TextStyle(
                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                      ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: valueOrDefault<String>(
                                                                        listViewStockListRecord.roomNo,
                                                                        '-',
                                                                      ),
                                                                      style: TextStyle(
                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                        fontSize: 16,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: ' ชื่อผู้รับ ',
                                                                        style: TextStyle(
                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: valueOrDefault<String>(
                                                                          listViewStockListRecord.receiveName,
                                                                          '-',
                                                                        ),
                                                                        style: TextStyle(
                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize: 16,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                          fontFamily: 'Kanit',
                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                  ),
                                                                  maxLines: 1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<String>(
                                                                    functions.getStockStatus(listViewStockListRecord.status),
                                                                    '-',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                        fontFamily: 'Kanit',
                                                                        color: () {
                                                                          if (listViewStockListRecord.status == 2) {
                                                                            return Color(0xFFE98A15);
                                                                          } else if (listViewStockListRecord.status == 3) {
                                                                            return FlutterFlowTheme.of(context).secondaryColor;
                                                                          } else {
                                                                            return Colors.black;
                                                                          }
                                                                        }(),
                                                                      ),
                                                                ),
                                                                if (listViewStockListRecord.status == 3)
                                                                  Text(
                                                                    ' เมื่อ ',
                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                          fontFamily: 'Kanit',
                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                  ),
                                                                if (listViewStockListRecord.status == 3)
                                                                  Text(
                                                                    dateTimeFormat('d/M H:mm', listViewStockListRecord.updateDate!),
                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                          fontFamily: 'Kanit',
                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
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
