import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'status_model.dart';
export 'status_model.dart';

/// Describes the condition of a subject
class StatusWidget extends StatefulWidget {
  const StatusWidget({
    super.key,
    required this.text,
    required this.fillColor,
    required this.borderColor,
    this.action,
    Color? textColor,
  }) : this.textColor = textColor ?? Colors.black;

  final String? text;
  final Color? fillColor;
  final Color? borderColor;
  final Future Function()? action;
  final Color textColor;

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  late StatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget!.fillColor,
          FlutterFlowTheme.of(context).primaryBackground,
        ),
        borderRadius: BorderRadius.circular(40.0),
        border: Border.all(
          color: valueOrDefault<Color>(
            widget!.borderColor,
            FlutterFlowTheme.of(context).secondaryBackground,
          ),
        ),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        child: Text(
          valueOrDefault<String>(
            widget!.text,
            'Status',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.plusJakartaSans(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: widget!.textColor,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
        ),
      ),
    );
  }
}
