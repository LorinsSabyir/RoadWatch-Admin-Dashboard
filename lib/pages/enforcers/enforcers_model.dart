import '/backend/backend.dart';
import '/components/side_nav_main/side_nav_main_widget.dart';
import '/components/status/status_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'enforcers_widget.dart' show EnforcersWidget;
import 'package:flutter/material.dart';

class EnforcersModel extends FlutterFlowModel<EnforcersWidget> {
  ///  Local state fields for this page.

  int selectedPage = 3;

  ///  State fields for stateful widgets in this page.

  // Model for SideNav_Main component.
  late SideNavMainModel sideNavMainModel;
  // State field(s) for searchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels1;
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels2;
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels3;
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels4;

  @override
  void initState(BuildContext context) {
    sideNavMainModel = createModel(context, () => SideNavMainModel());
    statusModels1 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels2 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels3 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels4 = FlutterFlowDynamicModels(() => StatusModel());
  }

  @override
  void dispose() {
    sideNavMainModel.dispose();
    searchBoxFocusNode?.dispose();
    searchBoxTextController?.dispose();

    statusModels1.dispose();
    statusModels2.dispose();
    statusModels3.dispose();
    statusModels4.dispose();
  }
}
