import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modals/side_nav/side_nav_widget.dart';
import 'appre_place_widget.dart' show ApprePlaceWidget;
import 'package:flutter/material.dart';

class ApprePlaceModel extends FlutterFlowModel<ApprePlaceWidget> {
  ///  Local state fields for this page.

  int selectedPage = 3;

  ///  State fields for stateful widgets in this page.

  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for searchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  List<ApprePlacesRecord> simpleSearchResults = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<ApprePlacesRecord>();
  // Stores action output result for [Backend Call - Create Document] action in deleteButton widget.
  AdminNotifRecord? apprePlaceDeleteNotif;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<ApprePlacesRecord>();
  // Stores action output result for [Backend Call - Create Document] action in deleteButton widget.
  AdminNotifRecord? apprePlaceDeleteSearchNotif;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    searchBoxFocusNode?.dispose();
    searchBoxTextController?.dispose();

    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
  }
}
