import '/components/dashboard_card/dashboard_card_widget.dart';
import '/components/notification_card/notification_card_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for NotificationCard dynamic component.
  late FlutterFlowDynamicModels<NotificationCardModel> notificationCardModels1;
  // Models for NotificationCard dynamic component.
  late FlutterFlowDynamicModels<NotificationCardModel> notificationCardModels2;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    columnController = ScrollController();
    totalCitationModel = createModel(context, () => DashboardCardModel());
    citationsTodayModel = createModel(context, () => DashboardCardModel());
    notificationCardModels1 =
        FlutterFlowDynamicModels(() => NotificationCardModel());
    notificationCardModels2 =
        FlutterFlowDynamicModels(() => NotificationCardModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    columnController?.dispose();
    totalCitationModel.dispose();
    citationsTodayModel.dispose();
    tabBarController?.dispose();
    notificationCardModels1.dispose();
    notificationCardModels2.dispose();
  }
}
