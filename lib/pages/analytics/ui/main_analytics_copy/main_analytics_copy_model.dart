import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/shared/components/status/status_widget.dart';
import '/shared/side_navigation/ui/side_nav_main/side_nav_main_widget.dart';
import 'main_analytics_copy_widget.dart' show MainAnalyticsCopyWidget;
import 'package:flutter/material.dart';

class MainAnalyticsCopyModel extends FlutterFlowModel<MainAnalyticsCopyWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  ///  State fields for stateful widgets in this page.

  // Model for SideNav_Main component.
  late SideNavMainModel sideNavMainModel;
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
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
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
