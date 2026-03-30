import '/backend/backend.dart';
import '/components/status/status_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modals/side_nav/side_nav_widget.dart';
import 'violators_widget.dart' show ViolatorsWidget;
import 'package:flutter/material.dart';

class ViolatorsModel extends FlutterFlowModel<ViolatorsWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  ///  State fields for stateful widgets in this page.

  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for FilterByMonthDropDown widget.
  String? filterByMonthDropDownValue;
  FormFieldController<String>? filterByMonthDropDownValueController;
  // State field(s) for FilterByYearDropDown widget.
  String? filterByYearDropDownValue;
  FormFieldController<String>? filterByYearDropDownValueController;
  // State field(s) for searchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  List<CitationRecord> simpleSearchResults = [];
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<CitationRecord>();
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels1;
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels2;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  AdminNotifRecord? confirmViolatorNotif;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<CitationRecord>();
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels3;
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels4;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  AdminNotifRecord? confirmSearchViolatorNotif;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController3 =
      FlutterFlowDataTableController<CitationRecord>();
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels5;
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels6;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  AdminNotifRecord? confirmUnpaidViolatorNotif;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController4 =
      FlutterFlowDataTableController<CitationRecord>();
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels7;
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels8;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  AdminNotifRecord? confirmSearchUnpaidViolatorNotif;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController5 =
      FlutterFlowDataTableController<CitationRecord>();
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels9;
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels10;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController6 =
      FlutterFlowDataTableController<CitationRecord>();
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels11;
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels12;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    statusModels1 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels2 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels3 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels4 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels5 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels6 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels7 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels8 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels9 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels10 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels11 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels12 = FlutterFlowDynamicModels(() => StatusModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    searchBoxFocusNode?.dispose();
    searchBoxTextController?.dispose();

    tabBarController?.dispose();
    paginatedDataTableController1.dispose();
    statusModels1.dispose();
    statusModels2.dispose();
    paginatedDataTableController2.dispose();
    statusModels3.dispose();
    statusModels4.dispose();
    paginatedDataTableController3.dispose();
    statusModels5.dispose();
    statusModels6.dispose();
    paginatedDataTableController4.dispose();
    statusModels7.dispose();
    statusModels8.dispose();
    paginatedDataTableController5.dispose();
    statusModels9.dispose();
    statusModels10.dispose();
    paginatedDataTableController6.dispose();
    statusModels11.dispose();
    statusModels12.dispose();
  }
}
