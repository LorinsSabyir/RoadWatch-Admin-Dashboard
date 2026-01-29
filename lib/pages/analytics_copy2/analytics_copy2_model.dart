import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modals/side_nav/side_nav_widget.dart';
import 'analytics_copy2_widget.dart' show AnalyticsCopy2Widget;
import 'package:flutter/material.dart';

class AnalyticsCopy2Model extends FlutterFlowModel<AnalyticsCopy2Widget> {
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

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    columnController = ScrollController();
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    columnController?.dispose();
  }
}
