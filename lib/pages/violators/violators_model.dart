import '/backend/backend.dart';
import '/components/is_empty_card/is_empty_card_widget.dart';
import '/components/status/status_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modals/side_nav/side_nav_widget.dart';
import 'violators_widget.dart' show ViolatorsWidget;
import 'package:flutter/material.dart';

class ViolatorsModel extends FlutterFlowModel<ViolatorsWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  ///  State fields for stateful widgets in this page.

  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for searchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  List<CitationRecord> simpleSearchResults = [];
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels1;
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels2;
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels3;
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels4;
  // Model for IsEmptyCard component.
  late IsEmptyCardModel isEmptyCardModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    columnController = ScrollController();
    statusModels1 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels2 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels3 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels4 = FlutterFlowDynamicModels(() => StatusModel());
    isEmptyCardModel = createModel(context, () => IsEmptyCardModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    columnController?.dispose();
    searchBoxFocusNode?.dispose();
    searchBoxTextController?.dispose();

    statusModels1.dispose();
    statusModels2.dispose();
    statusModels3.dispose();
    statusModels4.dispose();
    isEmptyCardModel.dispose();
  }
}
