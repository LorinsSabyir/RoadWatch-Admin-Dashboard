import '/components/dashboard_card/dashboard_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modals/side_nav/side_nav_widget.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for TotalCitation.
  late DashboardCardModel totalCitationModel;
  // Model for CitationsToday.
  late DashboardCardModel citationsTodayModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    columnController = ScrollController();
    totalCitationModel = createModel(context, () => DashboardCardModel());
    citationsTodayModel = createModel(context, () => DashboardCardModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    columnController?.dispose();
    totalCitationModel.dispose();
    citationsTodayModel.dispose();
  }
}
