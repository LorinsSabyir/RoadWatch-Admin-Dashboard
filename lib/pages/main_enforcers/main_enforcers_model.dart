import '/components/account_user_dropdown_widget.dart';
import '/components/side_nav_main_widget.dart';
import '/components/status_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'main_enforcers_widget.dart' show MainEnforcersWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainEnforcersModel extends FlutterFlowModel<MainEnforcersWidget> {
  ///  Local state fields for this page.

  int selectedPage = 3;

  ///  State fields for stateful widgets in this page.

  // Model for sideNav_Main component.
  late SideNavMainModel sideNavMainModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for Status component.
  late StatusModel statusModel1;
  // Model for Status component.
  late StatusModel statusModel2;

  @override
  void initState(BuildContext context) {
    sideNavMainModel = createModel(context, () => SideNavMainModel());
    statusModel1 = createModel(context, () => StatusModel());
    statusModel2 = createModel(context, () => StatusModel());
  }

  @override
  void dispose() {
    sideNavMainModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    statusModel1.dispose();
    statusModel2.dispose();
  }
}
