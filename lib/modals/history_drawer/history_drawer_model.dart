import '/components/history_card/history_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'history_drawer_widget.dart' show HistoryDrawerWidget;
import 'package:flutter/material.dart';

class HistoryDrawerModel extends FlutterFlowModel<HistoryDrawerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // Models for HistoryCard dynamic component.
  late FlutterFlowDynamicModels<HistoryCardModel> historyCardModels1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // Models for HistoryCard dynamic component.
  late FlutterFlowDynamicModels<HistoryCardModel> historyCardModels2;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    historyCardModels1 = FlutterFlowDynamicModels(() => HistoryCardModel());
    columnController2 = ScrollController();
    historyCardModels2 = FlutterFlowDynamicModels(() => HistoryCardModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    columnController1?.dispose();
    historyCardModels1.dispose();
    columnController2?.dispose();
    historyCardModels2.dispose();
  }
}
