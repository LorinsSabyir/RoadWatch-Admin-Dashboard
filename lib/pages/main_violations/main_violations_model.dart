import '/components/side_nav_main/side_nav_main_widget.dart';
import '/components/status/status_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'main_violations_widget.dart' show MainViolationsWidget;
import 'package:flutter/material.dart';

class MainViolationsModel extends FlutterFlowModel<MainViolationsWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  ///  State fields for stateful widgets in this page.

  // Model for sideNav_Main component.
  late SideNavMainModel sideNavMainModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  DateTime? datePicked1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels1;
  // Models for Status dynamic component.
  late FlutterFlowDynamicModels<StatusModel> statusModels2;

  @override
  void initState(BuildContext context) {
    sideNavMainModel = createModel(context, () => SideNavMainModel());
    statusModels1 = FlutterFlowDynamicModels(() => StatusModel());
    statusModels2 = FlutterFlowDynamicModels(() => StatusModel());
  }

  @override
  void dispose() {
    sideNavMainModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    statusModels1.dispose();
    statusModels2.dispose();
  }
}
