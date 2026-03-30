import '/backend/backend.dart';
import '/components/dashboard_card/dashboard_card_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modals/side_nav/side_nav_widget.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  String? brgyName = 'Brgy. A.O. Floirendo,';

  String? violationName = 'Arrogant Driver';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getCitationPercentPerMonth] action in Dashboard widget.
  double? getMonthPercent;
  // Stores action output result for [Custom Action - getCitationPercentPerDay] action in Dashboard widget.
  double? getDayPercent;
  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for CitationsToday.
  late DashboardCardModel citationsTodayModel;
  // Model for CItationsThisMonth.
  late DashboardCardModel cItationsThisMonthModel;
  // State field(s) for violationChartYearFilter widget.
  String? violationChartYearFilterValue;
  FormFieldController<String>? violationChartYearFilterValueController;
  // State field(s) for violationFilter widget.
  String? violationFilterValue;
  FormFieldController<String>? violationFilterValueController;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<ViolationSummaryByTypeTestRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<BarangaySummaryTestRecord>();

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    columnController = ScrollController();
    citationsTodayModel = createModel(context, () => DashboardCardModel());
    cItationsThisMonthModel = createModel(context, () => DashboardCardModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    columnController?.dispose();
    citationsTodayModel.dispose();
    cItationsThisMonthModel.dispose();
    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
  }
}
