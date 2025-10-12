import '/components/side_nav/side_nav_widget.dart';
import '/components/status/status_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'analytics_widget.dart' show AnalyticsWidget;
import 'package:flutter/material.dart';

class AnalyticsModel extends FlutterFlowModel<AnalyticsWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  ///  State fields for stateful widgets in this page.

  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Model for Status component.
  late StatusModel statusModel1;
  // Model for Status component.
  late StatusModel statusModel2;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    columnController = ScrollController();
    statusModel1 = createModel(context, () => StatusModel());
    statusModel2 = createModel(context, () => StatusModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    columnController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    statusModel1.dispose();
    statusModel2.dispose();
  }
}
