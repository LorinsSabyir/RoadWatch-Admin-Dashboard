import '/backend/backend.dart';
import '/components/is_empty_card/is_empty_card_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modals/side_nav/side_nav_widget.dart';
import 'fines_widget.dart' show FinesWidget;
import 'package:flutter/material.dart';

class FinesModel extends FlutterFlowModel<FinesWidget> {
  ///  Local state fields for this page.

  int selectedPage = 3;

  ///  State fields for stateful widgets in this page.

  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for searchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  List<ViolationRecord> simpleSearchResults = [];
  // Model for IsEmptyCard component.
  late IsEmptyCardModel isEmptyCardModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ViolationRecord>();

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    isEmptyCardModel = createModel(context, () => IsEmptyCardModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    searchBoxFocusNode?.dispose();
    searchBoxTextController?.dispose();

    isEmptyCardModel.dispose();
    paginatedDataTableController.dispose();
  }
}
