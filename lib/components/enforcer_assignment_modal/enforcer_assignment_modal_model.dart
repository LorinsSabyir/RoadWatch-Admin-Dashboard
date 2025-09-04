import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'enforcer_assignment_modal_widget.dart'
    show EnforcerAssignmentModalWidget;
import 'package:flutter/material.dart';

class EnforcerAssignmentModalModel
    extends FlutterFlowModel<EnforcerAssignmentModalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for searchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  List<ApprePlacesRecord> simpleSearchResults = [];
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBoxFocusNode?.dispose();
    searchBoxTextController?.dispose();
  }
}
