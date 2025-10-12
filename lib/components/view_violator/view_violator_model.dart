import '/flutter_flow/flutter_flow_util.dart';
import 'view_violator_widget.dart' show ViewViolatorWidget;
import 'package:flutter/material.dart';

class ViewViolatorModel extends FlutterFlowModel<ViewViolatorWidget> {
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
