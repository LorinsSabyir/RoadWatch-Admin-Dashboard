import '/components/graph_widget.dart';
import '/components/side_nav_main_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'main_analytics_widget.dart' show MainAnalyticsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainAnalyticsModel extends FlutterFlowModel<MainAnalyticsWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  ///  State fields for stateful widgets in this page.

  // Model for sideNav_Main component.
  late SideNavMainModel sideNavMainModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for graph component.
  late GraphModel graphModel1;
  // Model for graph component.
  late GraphModel graphModel2;

  @override
  void initState(BuildContext context) {
    sideNavMainModel = createModel(context, () => SideNavMainModel());
    graphModel1 = createModel(context, () => GraphModel());
    graphModel2 = createModel(context, () => GraphModel());
  }

  @override
  void dispose() {
    sideNavMainModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    graphModel1.dispose();
    graphModel2.dispose();
  }
}
