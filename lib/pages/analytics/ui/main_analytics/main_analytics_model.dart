import '/flutter_flow/flutter_flow_util.dart';
import '/shared/side_navigation/ui/side_nav_main/side_nav_main_widget.dart';
import 'main_analytics_widget.dart' show MainAnalyticsWidget;
import 'package:flutter/material.dart';

class MainAnalyticsModel extends FlutterFlowModel<MainAnalyticsWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  ///  State fields for stateful widgets in this page.

  // Model for SideNav_Main component.
  late SideNavMainModel sideNavMainModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    sideNavMainModel = createModel(context, () => SideNavMainModel());
  }

  @override
  void dispose() {
    sideNavMainModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
