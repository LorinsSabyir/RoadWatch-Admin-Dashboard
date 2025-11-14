import '/backend/backend.dart';
import '/components/is_empty_card/is_empty_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modals/side_nav/side_nav_widget.dart';
import 'appre_place_widget.dart' show ApprePlaceWidget;
import 'package:flutter/material.dart';

class ApprePlaceModel extends FlutterFlowModel<ApprePlaceWidget> {
  ///  Local state fields for this page.

  int selectedPage = 3;

  ///  State fields for stateful widgets in this page.

  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for searchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  List<ApprePlacesRecord> simpleSearchResults = [];
  // Model for IsEmptyCard component.
  late IsEmptyCardModel isEmptyCardModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    columnController = ScrollController();
    isEmptyCardModel = createModel(context, () => IsEmptyCardModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    columnController?.dispose();
    searchBoxFocusNode?.dispose();
    searchBoxTextController?.dispose();

    isEmptyCardModel.dispose();
  }
}
