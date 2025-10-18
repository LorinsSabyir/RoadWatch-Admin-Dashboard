import '/flutter_flow/flutter_flow_util.dart';
import 'add_fines_widget.dart' show AddFinesWidget;
import 'package:flutter/material.dart';

class AddFinesModel extends FlutterFlowModel<AddFinesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ViolationName widget.
  FocusNode? violationNameFocusNode;
  TextEditingController? violationNameTextController;
  String? Function(BuildContext, String?)? violationNameTextControllerValidator;
  // State field(s) for ViolationTitle widget.
  FocusNode? violationTitleFocusNode;
  TextEditingController? violationTitleTextController;
  String? Function(BuildContext, String?)?
      violationTitleTextControllerValidator;
  // State field(s) for Section widget.
  FocusNode? sectionFocusNode;
  TextEditingController? sectionTextController;
  String? Function(BuildContext, String?)? sectionTextControllerValidator;
  // State field(s) for Penalty widget.
  FocusNode? penaltyFocusNode;
  TextEditingController? penaltyTextController;
  String? Function(BuildContext, String?)? penaltyTextControllerValidator;
  // State field(s) for Fine widget.
  FocusNode? fineFocusNode;
  TextEditingController? fineTextController;
  String? Function(BuildContext, String?)? fineTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    violationNameFocusNode?.dispose();
    violationNameTextController?.dispose();

    violationTitleFocusNode?.dispose();
    violationTitleTextController?.dispose();

    sectionFocusNode?.dispose();
    sectionTextController?.dispose();

    penaltyFocusNode?.dispose();
    penaltyTextController?.dispose();

    fineFocusNode?.dispose();
    fineTextController?.dispose();
  }
}
