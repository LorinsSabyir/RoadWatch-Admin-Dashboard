import '/components/side_nav_main_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'main_analytics_copy_widget.dart' show MainAnalyticsCopyWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MainAnalyticsCopyModel extends FlutterFlowModel<MainAnalyticsCopyWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  ///  State fields for stateful widgets in this page.

  // Model for sideNav_Main component.
  late SideNavMainModel sideNavMainModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {
    sideNavMainModel = createModel(context, () => SideNavMainModel());
  }

  @override
  void dispose() {
    sideNavMainModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
  }
}
