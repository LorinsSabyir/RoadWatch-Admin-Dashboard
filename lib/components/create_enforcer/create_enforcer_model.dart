import '/flutter_flow/flutter_flow_util.dart';
import 'create_enforcer_widget.dart' show CreateEnforcerWidget;
import 'package:flutter/material.dart';

class CreateEnforcerModel extends FlutterFlowModel<CreateEnforcerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for enforcerEmail_create widget.
  FocusNode? enforcerEmailCreateFocusNode;
  TextEditingController? enforcerEmailCreateTextController;
  String? Function(BuildContext, String?)?
      enforcerEmailCreateTextControllerValidator;
  // State field(s) for enforcerPassword_create widget.
  FocusNode? enforcerPasswordCreateFocusNode;
  TextEditingController? enforcerPasswordCreateTextController;
  late bool enforcerPasswordCreateVisibility;
  String? Function(BuildContext, String?)?
      enforcerPasswordCreateTextControllerValidator;
  // State field(s) for enforcerPasswordConfirm_create widget.
  FocusNode? enforcerPasswordConfirmCreateFocusNode;
  TextEditingController? enforcerPasswordConfirmCreateTextController;
  late bool enforcerPasswordConfirmCreateVisibility;
  String? Function(BuildContext, String?)?
      enforcerPasswordConfirmCreateTextControllerValidator;
  // State field(s) for enforcerBadgeNum_create widget.
  FocusNode? enforcerBadgeNumCreateFocusNode;
  TextEditingController? enforcerBadgeNumCreateTextController;
  String? Function(BuildContext, String?)?
      enforcerBadgeNumCreateTextControllerValidator;
  // State field(s) for enforcerName_create widget.
  FocusNode? enforcerNameCreateFocusNode;
  TextEditingController? enforcerNameCreateTextController;
  String? Function(BuildContext, String?)?
      enforcerNameCreateTextControllerValidator;
  // State field(s) for enforcerPhoneNum_create widget.
  FocusNode? enforcerPhoneNumCreateFocusNode;
  TextEditingController? enforcerPhoneNumCreateTextController;
  String? Function(BuildContext, String?)?
      enforcerPhoneNumCreateTextControllerValidator;

  @override
  void initState(BuildContext context) {
    enforcerPasswordCreateVisibility = false;
    enforcerPasswordConfirmCreateVisibility = false;
  }

  @override
  void dispose() {
    enforcerEmailCreateFocusNode?.dispose();
    enforcerEmailCreateTextController?.dispose();

    enforcerPasswordCreateFocusNode?.dispose();
    enforcerPasswordCreateTextController?.dispose();

    enforcerPasswordConfirmCreateFocusNode?.dispose();
    enforcerPasswordConfirmCreateTextController?.dispose();

    enforcerBadgeNumCreateFocusNode?.dispose();
    enforcerBadgeNumCreateTextController?.dispose();

    enforcerNameCreateFocusNode?.dispose();
    enforcerNameCreateTextController?.dispose();

    enforcerPhoneNumCreateFocusNode?.dispose();
    enforcerPhoneNumCreateTextController?.dispose();
  }
}
