import '/flutter_flow/flutter_flow_util.dart';
import '/pages/dashboard/components/dashboard_card/dashboard_card_widget.dart';
import '/shared/side_navigation/ui/side_nav_main/side_nav_main_widget.dart';
import 'main_dashboard_widget.dart' show MainDashboardWidget;
import 'package:flutter/material.dart';

class MainDashboardModel extends FlutterFlowModel<MainDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SideNav_Main component.
  late SideNavMainModel sideNavMainModel;
  // Model for DashboardCard component.
  late DashboardCardModel dashboardCardModel1;
  // Model for DashboardCard component.
  late DashboardCardModel dashboardCardModel2;

  @override
  void initState(BuildContext context) {
    sideNavMainModel = createModel(context, () => SideNavMainModel());
    dashboardCardModel1 = createModel(context, () => DashboardCardModel());
    dashboardCardModel2 = createModel(context, () => DashboardCardModel());
  }

  @override
  void dispose() {
    sideNavMainModel.dispose();
    dashboardCardModel1.dispose();
    dashboardCardModel2.dispose();
  }
}
