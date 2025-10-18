import '/backend/backend.dart';
import '/components/notification_card/notification_card_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'appre_place_widget.dart' show ApprePlaceWidget;
import 'package:flutter/material.dart';

class ApprePlaceModel extends FlutterFlowModel<ApprePlaceWidget> {
  ///  Local state fields for this page.

  int selectedPage = 3;

  ///  State fields for stateful widgets in this page.

  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for searchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  List<ApprePlacesRecord> simpleSearchResults = [];
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
    notificationCardModels1 =
        FlutterFlowDynamicModels(() => NotificationCardModel());
    notificationCardModels2 =
        FlutterFlowDynamicModels(() => NotificationCardModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    columnController?.dispose();
    searchBoxFocusNode?.dispose();
    searchBoxTextController?.dispose();

    tabBarController?.dispose();
    notificationCardModels1.dispose();
    notificationCardModels2.dispose();
  }
}
