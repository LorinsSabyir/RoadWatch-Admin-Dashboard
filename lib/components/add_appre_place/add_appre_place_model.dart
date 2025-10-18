import '/flutter_flow/flutter_flow_util.dart';
import 'add_appre_place_widget.dart' show AddApprePlaceWidget;
import 'package:flutter/material.dart';

class AddApprePlaceModel extends FlutterFlowModel<AddApprePlaceWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Landmark widget.
  FocusNode? landmarkFocusNode;
  TextEditingController? landmarkTextController;
  String? Function(BuildContext, String?)? landmarkTextControllerValidator;
  // State field(s) for Barangay widget.
  FocusNode? barangayFocusNode;
  TextEditingController? barangayTextController;
  String? Function(BuildContext, String?)? barangayTextControllerValidator;
  // State field(s) for Purok widget.
  FocusNode? purokFocusNode;
  TextEditingController? purokTextController;
  String? Function(BuildContext, String?)? purokTextControllerValidator;
  // State field(s) for Street widget.
  FocusNode? streetFocusNode;
  TextEditingController? streetTextController;
  String? Function(BuildContext, String?)? streetTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    landmarkFocusNode?.dispose();
    landmarkTextController?.dispose();

    barangayFocusNode?.dispose();
    barangayTextController?.dispose();

    purokFocusNode?.dispose();
    purokTextController?.dispose();

    streetFocusNode?.dispose();
    streetTextController?.dispose();
  }
}
