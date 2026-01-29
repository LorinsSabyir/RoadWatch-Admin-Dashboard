import '/backend/backend.dart';
import '/components/dashboard_card/dashboard_card_widget.dart';
import '/components/is_empty_card/is_empty_card_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modals/side_nav/side_nav_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  static String routeName = 'Dashboard';
  static String routePath = '/dashboard';

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      _model.getMonthPercent = await actions.getCitationPercentPerMonth();
      _model.getDayPercent = await actions.getCitationPercentPerDay();
      await Future.delayed(
        Duration(
          milliseconds: 2000,
        ),
      );
      FFAppState().ThisDayPercentage = _model.getDayPercent!;
      FFAppState().ThisMonthPercentage = _model.getMonthPercent!;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Dashboard',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Builder(
                  builder: (context) => wrapWithModel(
                    model: _model.sideNavModel,
                    updateCallback: () => safeSetState(() {}),
                    child: SideNavWidget(
                      selectedNav: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 1470.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          controller: _model.columnController1,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Panabo City Overview',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Below is an overview of traffic violations.',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Wrap(
                                  spacing: 16.0,
                                  runSpacing: 16.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    FutureBuilder<int>(
                                      future: queryCitationRecordCount(
                                        queryBuilder: (citationRecord) =>
                                            citationRecord
                                                .where(
                                                  'appre_date_day',
                                                  isEqualTo: dateTimeFormat(
                                                      "dd",
                                                      getCurrentTimestamp),
                                                )
                                                .where(
                                                  'appre_date_month',
                                                  isEqualTo: dateTimeFormat(
                                                      "MMMM",
                                                      getCurrentTimestamp),
                                                )
                                                .where(
                                                  'appre_date_year',
                                                  isEqualTo: dateTimeFormat(
                                                      "yyyy",
                                                      getCurrentTimestamp),
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        int citationsTodayCount =
                                            snapshot.data!;

                                        return wrapWithModel(
                                          model: _model.citationsTodayModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          updateOnChange: true,
                                          child: DashboardCardWidget(
                                            title: 'Citation Issued Today',
                                            value: citationsTodayCount,
                                            percent:
                                                FFAppState().ThisDayPercentage,
                                          ),
                                        );
                                      },
                                    ),
                                    FutureBuilder<int>(
                                      future: queryCitationRecordCount(
                                        queryBuilder: (citationRecord) =>
                                            citationRecord
                                                .where(
                                                  'appre_date_month',
                                                  isEqualTo: dateTimeFormat(
                                                      "MMMM",
                                                      getCurrentTimestamp),
                                                )
                                                .where(
                                                  'appre_date_year',
                                                  isEqualTo: dateTimeFormat(
                                                      "yyyy",
                                                      getCurrentTimestamp),
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        int cItationsThisMonthCount =
                                            snapshot.data!;

                                        return wrapWithModel(
                                          model: _model.cItationsThisMonthModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          updateOnChange: true,
                                          child: DashboardCardWidget(
                                            title: 'Total Citations This Month',
                                            value: cItationsThisMonthCount,
                                            percent: FFAppState()
                                                .ThisMonthPercentage,
                                          ),
                                        );
                                      },
                                    ),
                                    FutureBuilder<int>(
                                      future: queryCitationRecordCount(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        int totalCitationCount = snapshot.data!;

                                        return Container(
                                          width: 275.0,
                                          height: 100.0,
                                          constraints: BoxConstraints(
                                            maxWidth: 350.0,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Total Citations',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Text(
                                                  totalCitationCount.toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.outfit(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Container(
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Violation Graph - ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      FlutterFlowDropDown<
                                                          String>(
                                                        controller: _model
                                                                .violationChartYearFilterValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model.violationChartYearFilterValue ??=
                                                              dateTimeFormat(
                                                                  "yyyy",
                                                                  getCurrentTimestamp),
                                                        ),
                                                        options: [
                                                          '2026',
                                                          '2025',
                                                          '2024',
                                                          '2023',
                                                          '2022',
                                                          '2021',
                                                          '2020',
                                                          '2012'
                                                        ],
                                                        onChanged: (val) async {
                                                          safeSetState(() =>
                                                              _model.violationChartYearFilterValue =
                                                                  val);
                                                          safeSetState(() {});
                                                        },
                                                        width: 130.0,
                                                        height: 35.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .plusJakartaSans(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintText: 'Year',
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 0.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                      FlutterFlowDropDown<
                                                          String>(
                                                        controller: _model
                                                                .violationChartMonthFilterValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model.violationChartMonthFilterValue ??=
                                                              dateTimeFormat(
                                                                  "MMMM",
                                                                  getCurrentTimestamp),
                                                        ),
                                                        options: [
                                                          'January',
                                                          'February',
                                                          'March',
                                                          'April',
                                                          'May',
                                                          'June',
                                                          'July',
                                                          'August',
                                                          'September',
                                                          'October',
                                                          'November',
                                                          'December'
                                                        ],
                                                        onChanged: (val) async {
                                                          safeSetState(() =>
                                                              _model.violationChartMonthFilterValue =
                                                                  val);
                                                          safeSetState(() {});
                                                        },
                                                        width: 130.0,
                                                        height: 35.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .plusJakartaSans(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintText: 'Month',
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 0.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .violationFilterValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.violationFilterValue ??=
                                                            'Whole Panabo',
                                                      ),
                                                      options: [
                                                        'Whole Panabo',
                                                        'Per Barangay',
                                                        'Per Violation'
                                                      ],
                                                      onChanged: (val) async {
                                                        safeSetState(() => _model
                                                                .violationFilterValue =
                                                            val);
                                                        safeSetState(() {});
                                                      },
                                                      width: 160.0,
                                                      height: 35.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .plusJakartaSans(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      hintText: 'Filter',
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderWidth: 0.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model
                                                            .violationFilterValue ==
                                                        'Whole Panabo')
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  ViolationSummaryRecord>>(
                                                            stream:
                                                                queryViolationSummaryRecord(
                                                              queryBuilder: (violationSummaryRecord) =>
                                                                  violationSummaryRecord
                                                                      .orderBy(
                                                                          'month_num'),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<ViolationSummaryRecord>
                                                                  wholePanaboGraphViolationSummaryRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 350.0,
                                                                  child: Stack(
                                                                    children: [
                                                                      FlutterFlowLineChart(
                                                                        data: [
                                                                          FFLineChartData(
                                                                            xData:
                                                                                wholePanaboGraphViolationSummaryRecordList.where((e) => e.year == _model.violationChartYearFilterValue).toList().map((d) => d.monthNum).toList(),
                                                                            yData:
                                                                                wholePanaboGraphViolationSummaryRecordList.where((e) => e.year == _model.violationChartYearFilterValue).toList().map((d) => d.actualViolations).toList(),
                                                                            settings:
                                                                                LineChartBarData(
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              barWidth: 3.0,
                                                                              isCurved: true,
                                                                              preventCurveOverShooting: true,
                                                                            ),
                                                                          ),
                                                                          FFLineChartData(
                                                                            xData:
                                                                                wholePanaboGraphViolationSummaryRecordList.where((e) => e.year == _model.violationChartYearFilterValue).toList().map((d) => d.monthNum).toList(),
                                                                            yData:
                                                                                wholePanaboGraphViolationSummaryRecordList.where((e) => e.year == _model.violationChartYearFilterValue).toList().map((d) => d.forecastedViolations).toList(),
                                                                            settings:
                                                                                LineChartBarData(
                                                                              color: FlutterFlowTheme.of(context).success,
                                                                              barWidth: 2.0,
                                                                              isCurved: true,
                                                                              preventCurveOverShooting: true,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        chartStylingInfo:
                                                                            ChartStylingInfo(
                                                                          enableTooltip:
                                                                              true,
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          showGrid:
                                                                              true,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          borderWidth:
                                                                              1.0,
                                                                        ),
                                                                        axisBounds:
                                                                            AxisBounds(
                                                                          minX:
                                                                              1.0,
                                                                          maxX:
                                                                              12.0,
                                                                        ),
                                                                        xAxisLabelInfo:
                                                                            AxisLabelInfo(
                                                                          title:
                                                                              'Month',
                                                                          titleTextStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          showLabels:
                                                                              true,
                                                                          labelTextStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                          labelInterval:
                                                                              1.0,
                                                                          reservedSize:
                                                                              12.0,
                                                                        ),
                                                                        yAxisLabelInfo:
                                                                            AxisLabelInfo(
                                                                          title:
                                                                              'Total Number of Violations',
                                                                          titleTextStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          showLabels:
                                                                              true,
                                                                          labelTextStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                          labelInterval:
                                                                              100.0,
                                                                          reservedSize:
                                                                              100.0,
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.8,
                                                                            1.1),
                                                                        child:
                                                                            FlutterFlowChartLegendWidget(
                                                                          entries: [
                                                                            LegendEntry(FlutterFlowTheme.of(context).tertiary,
                                                                                'Number of violations'),
                                                                            LegendEntry(FlutterFlowTheme.of(context).success,
                                                                                'Forecasted violations'),
                                                                          ],
                                                                          width:
                                                                              200.0,
                                                                          height:
                                                                              43.0,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          textPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          borderWidth:
                                                                              0.0,
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          indicatorSize:
                                                                              10.0,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model
                                                            .violationFilterValue ==
                                                        'Per Barangay')
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  ViolationSummaryPerBrgyRecord>>(
                                                            stream:
                                                                queryViolationSummaryPerBrgyRecord(
                                                              queryBuilder: (violationSummaryPerBrgyRecord) =>
                                                                  violationSummaryPerBrgyRecord.orderBy(
                                                                      'actual_violations',
                                                                      descending:
                                                                          true),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<ViolationSummaryPerBrgyRecord>
                                                                  perBarangayGraphViolationSummaryPerBrgyRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 350.0,
                                                                  child: Stack(
                                                                    children: [
                                                                      FlutterFlowBarChart(
                                                                        barData: [
                                                                          FFBarChartData(
                                                                            yData:
                                                                                perBarangayGraphViolationSummaryPerBrgyRecordList.where((e) => (e.year == _model.violationChartYearFilterValue) && (e.month == _model.violationChartMonthFilterValue)).toList().take(5).toList().map((d) => d.actualViolations).toList(),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                          FFBarChartData(
                                                                            yData:
                                                                                perBarangayGraphViolationSummaryPerBrgyRecordList.where((e) => (e.year == _model.violationChartYearFilterValue) && (e.month == _model.violationChartMonthFilterValue)).toList().take(5).toList().map((d) => d.forecastedViolations).toList(),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).success,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderColor:
                                                                                Color(0xFF1A6F61),
                                                                          )
                                                                        ],
                                                                        xLabels: perBarangayGraphViolationSummaryPerBrgyRecordList
                                                                            .where((e) =>
                                                                                (e.year == _model.violationChartYearFilterValue) &&
                                                                                (e.month == _model.violationChartMonthFilterValue))
                                                                            .toList()
                                                                            .take(5)
                                                                            .toList()
                                                                            .map((d) => d.barangay)
                                                                            .toList(),
                                                                        barWidth:
                                                                            32.0,
                                                                        barBorderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        barSpace:
                                                                            8.0,
                                                                        groupSpace:
                                                                            8.0,
                                                                        alignment:
                                                                            BarChartAlignment.spaceAround,
                                                                        chartStylingInfo:
                                                                            ChartStylingInfo(
                                                                          enableTooltip:
                                                                              true,
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          showGrid:
                                                                              true,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          borderWidth:
                                                                              1.0,
                                                                        ),
                                                                        axisBounds:
                                                                            AxisBounds(),
                                                                        xAxisLabelInfo:
                                                                            AxisLabelInfo(
                                                                          title:
                                                                              'Months',
                                                                          titleTextStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          showLabels:
                                                                              true,
                                                                          labelTextStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                          labelInterval:
                                                                              10.0,
                                                                          reservedSize:
                                                                              28.0,
                                                                        ),
                                                                        yAxisLabelInfo:
                                                                            AxisLabelInfo(
                                                                          title:
                                                                              'Total Number of Violation',
                                                                          titleTextStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          showLabels:
                                                                              true,
                                                                          labelTextStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                          labelInterval:
                                                                              10.0,
                                                                          reservedSize:
                                                                              100.0,
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.8,
                                                                            1.1),
                                                                        child:
                                                                            FlutterFlowChartLegendWidget(
                                                                          entries: [
                                                                            LegendEntry(FlutterFlowTheme.of(context).tertiary,
                                                                                'Number of violations per Barangay'),
                                                                            LegendEntry(FlutterFlowTheme.of(context).success,
                                                                                'Forecasted number of violations'),
                                                                          ],
                                                                          width:
                                                                              200.0,
                                                                          height:
                                                                              50.0,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          textPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          borderWidth:
                                                                              0.0,
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          indicatorSize:
                                                                              10.0,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model
                                                            .violationFilterValue ==
                                                        'Per Violation')
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  ViolationSummaryPerViolationRecord>>(
                                                            stream:
                                                                queryViolationSummaryPerViolationRecord(
                                                              queryBuilder:
                                                                  (violationSummaryPerViolationRecord) =>
                                                                      violationSummaryPerViolationRecord
                                                                          .where(
                                                                            'year',
                                                                            isEqualTo:
                                                                                _model.violationChartYearFilterValue,
                                                                          )
                                                                          .where(
                                                                            'month',
                                                                            isEqualTo:
                                                                                _model.violationChartMonthFilterValue,
                                                                          ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<ViolationSummaryPerViolationRecord>
                                                                  perViolationGraphViolationSummaryPerViolationRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final perViolationGraphViolationSummaryPerViolationRecord =
                                                                  perViolationGraphViolationSummaryPerViolationRecordList
                                                                          .isNotEmpty
                                                                      ? perViolationGraphViolationSummaryPerViolationRecordList
                                                                          .first
                                                                      : null;

                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 350.0,
                                                                  child: Stack(
                                                                    children: [
                                                                      FlutterFlowBarChart(
                                                                        barData: [
                                                                          FFBarChartData(
                                                                            yData:
                                                                                perViolationGraphViolationSummaryPerViolationRecord!.totalOccurrences,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          )
                                                                        ],
                                                                        xLabels: perViolationGraphViolationSummaryPerViolationRecord
                                                                            .violationName
                                                                            .take(5)
                                                                            .toList(),
                                                                        barWidth:
                                                                            32.0,
                                                                        barBorderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        groupSpace:
                                                                            8.0,
                                                                        alignment:
                                                                            BarChartAlignment.spaceAround,
                                                                        chartStylingInfo:
                                                                            ChartStylingInfo(
                                                                          enableTooltip:
                                                                              true,
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          showGrid:
                                                                              true,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          borderWidth:
                                                                              1.0,
                                                                        ),
                                                                        axisBounds:
                                                                            AxisBounds(),
                                                                        xAxisLabelInfo:
                                                                            AxisLabelInfo(
                                                                          title:
                                                                              'Months',
                                                                          titleTextStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          showLabels:
                                                                              true,
                                                                          labelTextStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                          labelInterval:
                                                                              10.0,
                                                                          reservedSize:
                                                                              28.0,
                                                                        ),
                                                                        yAxisLabelInfo:
                                                                            AxisLabelInfo(
                                                                          title:
                                                                              'Total Number of Violation',
                                                                          titleTextStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          showLabels:
                                                                              true,
                                                                          labelTextStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                          labelInterval:
                                                                              100.0,
                                                                          reservedSize:
                                                                              100.0,
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.8,
                                                                            1.1),
                                                                        child:
                                                                            FlutterFlowChartLegendWidget(
                                                                          entries: [
                                                                            LegendEntry(FlutterFlowTheme.of(context).tertiary,
                                                                                'Violation Data'),
                                                                          ],
                                                                          width:
                                                                              200.0,
                                                                          height:
                                                                              50.0,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          textPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          borderWidth:
                                                                              0.0,
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          indicatorSize:
                                                                              10.0,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 16.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        1.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Top Violations',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .outfit(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    ViolationSummaryPerViolationRecord>>(
                                                              stream:
                                                                  queryViolationSummaryPerViolationRecord(
                                                                queryBuilder:
                                                                    (violationSummaryPerViolationRecord) =>
                                                                        violationSummaryPerViolationRecord
                                                                            .where(
                                                                              'year',
                                                                              isEqualTo: _model.violationChartYearFilterValue,
                                                                            )
                                                                            .where(
                                                                              'month',
                                                                              isEqualTo: _model.violationChartMonthFilterValue,
                                                                            ),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<ViolationSummaryPerViolationRecord>
                                                                    containerViolationSummaryPerViolationRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final containerViolationSummaryPerViolationRecord =
                                                                    containerViolationSummaryPerViolationRecordList
                                                                            .isNotEmpty
                                                                        ? containerViolationSummaryPerViolationRecordList
                                                                            .first
                                                                        : null;

                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    primary:
                                                                        false,
                                                                    controller:
                                                                        _model
                                                                            .columnController2,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              flex: 4,
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final violationName = containerViolationSummaryPerViolationRecord?.violationName.toList() ?? [];

                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: List.generate(violationName.length, (violationNameIndex) {
                                                                                      final violationNameItem = violationName[violationNameIndex];
                                                                                      return Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: 50.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: valueOrDefault<Color>(
                                                                                            (violationNameIndex % 2).toString() == '1' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).alternate,
                                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(0.0),
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            violationNameItem,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.plusJakartaSans(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 2,
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final violationName = containerViolationSummaryPerViolationRecord?.violationSection.toList() ?? [];

                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(violationName.length, (violationNameIndex) {
                                                                                      final violationNameItem = violationName[violationNameIndex];
                                                                                      return Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: 50.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: valueOrDefault<Color>(
                                                                                            (violationNameIndex % 2).toString() == '1' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).alternate,
                                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                                          ),
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Text(
                                                                                          violationNameItem,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final violationName = containerViolationSummaryPerViolationRecord?.totalOccurrences.toList() ?? [];

                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: List.generate(violationName.length, (violationNameIndex) {
                                                                                      final violationNameItem = violationName[violationNameIndex];
                                                                                      return Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: 50.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: valueOrDefault<Color>(
                                                                                            (violationNameIndex % 2).toString() == '1' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).alternate,
                                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                                          ),
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 26.0, 0.0),
                                                                                          child: Text(
                                                                                            violationNameItem.toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.plusJakartaSans(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 16.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Citations per barangay',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: StreamBuilder<
                                                            List<
                                                                ViolationSummaryPerBrgyRecord>>(
                                                          stream:
                                                              queryViolationSummaryPerBrgyRecord(
                                                            queryBuilder: (violationSummaryPerBrgyRecord) =>
                                                                violationSummaryPerBrgyRecord.orderBy(
                                                                    'actual_violations',
                                                                    descending:
                                                                        true),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<ViolationSummaryPerBrgyRecord>
                                                                containerViolationSummaryPerBrgyRecordList =
                                                                snapshot.data!;

                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final violationsSummPerBrgy = containerViolationSummaryPerBrgyRecordList
                                                                      .where((e) =>
                                                                          (e.month ==
                                                                              _model
                                                                                  .violationChartMonthFilterValue) &&
                                                                          (e.year ==
                                                                              _model.violationChartYearFilterValue))
                                                                      .toList();
                                                                  if (violationsSummPerBrgy
                                                                      .isEmpty) {
                                                                    return IsEmptyCardWidget();
                                                                  }

                                                                  return FlutterFlowDataTable<
                                                                      ViolationSummaryPerBrgyRecord>(
                                                                    controller:
                                                                        _model
                                                                            .paginatedDataTableController,
                                                                    data:
                                                                        violationsSummPerBrgy,
                                                                    columnsBuilder:
                                                                        (onSortChanged) =>
                                                                            [
                                                                      DataColumn2(
                                                                        label: DefaultTextStyle
                                                                            .merge(
                                                                          softWrap:
                                                                              true,
                                                                          child:
                                                                              Container(),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                    dataRowBuilder: (violationsSummPerBrgyItem,
                                                                            violationsSummPerBrgyIndex,
                                                                            selected,
                                                                            onSelectChanged) =>
                                                                        DataRow(
                                                                      color: WidgetStateProperty
                                                                          .all(
                                                                        violationsSummPerBrgyIndex % 2 ==
                                                                                0
                                                                            ? FlutterFlowTheme.of(context).alternate
                                                                            : FlutterFlowTheme.of(context).primaryBackground,
                                                                      ),
                                                                      cells: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              violationsSummPerBrgyItem.barangay,
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    font: GoogleFonts.plusJakartaSans(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                violationsSummPerBrgyItem.actualViolations.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    font: GoogleFonts.plusJakartaSans(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ]
                                                                          .map((c) =>
                                                                              DataCell(c))
                                                                          .toList(),
                                                                    ),
                                                                    emptyBuilder:
                                                                        () =>
                                                                            IsEmptyCardWidget(),
                                                                    paginated:
                                                                        true,
                                                                    selectable:
                                                                        false,
                                                                    hidePaginator:
                                                                        false,
                                                                    showFirstLastButtons:
                                                                        true,
                                                                    headingRowHeight:
                                                                        0.0,
                                                                    dataRowHeight:
                                                                        48.0,
                                                                    columnSpacing:
                                                                        20.0,
                                                                    headingRowColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              0.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                    ),
                                                                    addHorizontalDivider:
                                                                        false,
                                                                    addTopAndBottomDivider:
                                                                        false,
                                                                    hideDefaultHorizontalDivider:
                                                                        true,
                                                                    addVerticalDivider:
                                                                        false,
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 16.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 16.0))
                                .addToEnd(SizedBox(height: 24.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
