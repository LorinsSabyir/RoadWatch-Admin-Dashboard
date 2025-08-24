import '/backend/backend.dart';
import '/components/side_nav_main/side_nav_main_widget.dart';
import '/components/status/status_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'violators_widget.dart' show ViolatorsWidget;
import 'package:flutter/material.dart';

class ViolatorsModel extends FlutterFlowModel<ViolatorsWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  ///  State fields for stateful widgets in this page.

  // Model for SideNav_Main component.
  late SideNavMainModel sideNavMainModel;
  // State field(s) for searchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  List<CitationRecord> simpleSearchResults = [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
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
