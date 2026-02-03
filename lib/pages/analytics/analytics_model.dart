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

  ///  State fields for stateful widgets in this page.

  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for violationChartYearFilter widget.
  String? violationChartYearFilterValue;
  FormFieldController<String>? violationChartYearFilterValueController;
  // State field(s) for violationChartMonthFilter widget.
  String? violationChartMonthFilterValue;
  FormFieldController<String>? violationChartMonthFilterValueController;
  // State field(s) for violationFilter widget.
  String? violationFilterValue;
  FormFieldController<String>? violationFilterValueController;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<ViolationSummaryRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<ViolationSummaryPerBrgyRecord>();

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    columnController = ScrollController();
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    columnController?.dispose();
    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
  }
}
