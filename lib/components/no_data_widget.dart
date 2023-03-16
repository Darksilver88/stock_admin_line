import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_data_model.dart';
export 'no_data_model.dart';

class NoDataWidget extends StatefulWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  _NoDataWidgetState createState() => _NoDataWidgetState();
}

class _NoDataWidgetState extends State<NoDataWidget> {
  late NoDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDataModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.info_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 36.0,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Text(
              'ไม่มีข้อมูล',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Kanit',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 18.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
