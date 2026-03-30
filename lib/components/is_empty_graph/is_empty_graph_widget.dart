import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'is_empty_graph_model.dart';
export 'is_empty_graph_model.dart';

class IsEmptyGraphWidget extends StatefulWidget {
  const IsEmptyGraphWidget({
    super.key,
    this.height,
  });

  final int? height;

  @override
  State<IsEmptyGraphWidget> createState() => _IsEmptyGraphWidgetState();
}

class _IsEmptyGraphWidgetState extends State<IsEmptyGraphWidget> {
  late IsEmptyGraphModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IsEmptyGraphModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: valueOrDefault<double>(
        widget.height?.toDouble(),
        500.0,
      ),
      decoration: BoxDecoration(),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.query_stats_rounded,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 70.0,
          ),
          Text(
            'Graph Empty!\nSelect an item in the table',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  font: GoogleFonts.outfit(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                ),
          ),
        ].divide(SizedBox(height: 8.0)),
      ),
    );
  }
}
