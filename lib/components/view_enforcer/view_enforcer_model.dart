import '/flutter_flow/flutter_flow_util.dart';
import 'view_enforcer_widget.dart' show ViewEnforcerWidget;
import 'package:flutter/material.dart';

class ViewEnforcerModel extends FlutterFlowModel<ViewEnforcerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
