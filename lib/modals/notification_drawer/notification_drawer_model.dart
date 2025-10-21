import '/components/notification_card/notification_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notification_drawer_widget.dart' show NotificationDrawerWidget;
import 'package:flutter/material.dart';

class NotificationDrawerModel
    extends FlutterFlowModel<NotificationDrawerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // Models for NotificationCard dynamic component.
  late FlutterFlowDynamicModels<NotificationCardModel> notificationCardModels1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // Models for NotificationCard dynamic component.
  late FlutterFlowDynamicModels<NotificationCardModel> notificationCardModels2;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    notificationCardModels1 =
        FlutterFlowDynamicModels(() => NotificationCardModel());
    columnController2 = ScrollController();
    notificationCardModels2 =
        FlutterFlowDynamicModels(() => NotificationCardModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    columnController1?.dispose();
    notificationCardModels1.dispose();
    columnController2?.dispose();
    notificationCardModels2.dispose();
  }
}
