import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modals/side_nav/side_nav_widget.dart';
import 'analytics_widget.dart' show AnalyticsWidget;
import 'package:flutter/material.dart';

class AnalyticsModel extends FlutterFlowModel<AnalyticsWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  String? barangayName = 'Brgy. A.O. Floirendo,';

  String? violationName = 'Arrogant Driver';

  ///  State fields for stateful widgets in this page.

  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for violationChartYearFilter widget.
  String? violationChartYearFilterValue;
  FormFieldController<String>? violationChartYearFilterValueController;
  // State field(s) for violationFilter widget.
  String? violationFilterValue;
  FormFieldController<String>? violationFilterValueController;
  // State field(s) for searchBox widget.
  FocusNode? searchBoxFocusNode1;
  TextEditingController? searchBoxTextController1;
  String? Function(BuildContext, String?)? searchBoxTextController1Validator;
  List<BarangaySummaryTestRecord> simpleSearchResults1 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<BarangaySummaryTestRecord>();
  // State field(s) for SearchDataTable widget.
  final searchDataTableController1 =
      FlutterFlowDataTableController<BarangaySummaryTestRecord>();
  // State field(s) for searchBox widget.
  FocusNode? searchBoxFocusNode2;
  TextEditingController? searchBoxTextController2;
  String? Function(BuildContext, String?)? searchBoxTextController2Validator;
  List<ViolationSummaryByTypeTestRecord> simpleSearchResults2 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<ViolationSummaryByTypeTestRecord>();
  // State field(s) for SearchDataTable widget.
  final searchDataTableController2 =
      FlutterFlowDataTableController<ViolationSummaryByTypeTestRecord>();

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    columnController = ScrollController();
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    columnController?.dispose();
    searchBoxFocusNode1?.dispose();
    searchBoxTextController1?.dispose();

    paginatedDataTableController1.dispose();
    searchDataTableController1.dispose();
    searchBoxFocusNode2?.dispose();
    searchBoxTextController2?.dispose();

    paginatedDataTableController2.dispose();
    searchDataTableController2.dispose();
  }
}
