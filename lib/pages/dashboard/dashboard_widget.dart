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
                          controller: _model.columnController,
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
                                      'Overview',
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
                                                  isEqualTo: '2024',
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
                                                  isEqualTo: '2024',
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
                                                        'Panabo Violation Graph - ',
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
                                                      if ((_model.violationFilterValue ==
                                                              'Per Barangay') ||
                                                          (_model.violationFilterValue ==
                                                              'Per Violation'))
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
                                                          onChanged:
                                                              (val) async {
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
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
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
                                                                            AxisBounds(),
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
                                                                              32.0,
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
                                                                              40.0,
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
                                                                                'Number of violations per Barangay'),
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
                                                                  perViolationGraphViolationSummaryRecordList =
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
                                                                                perViolationGraphViolationSummaryRecordList.where((e) => e.year == _model.violationChartYearFilterValue).toList().map((d) => d.monthNum).toList(),
                                                                            yData:
                                                                                perViolationGraphViolationSummaryRecordList.where((e) => e.year == _model.violationChartYearFilterValue).toList().map((d) => d.actualViolations).toList(),
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
                                                                                perViolationGraphViolationSummaryRecordList.where((e) => e.year == _model.violationChartYearFilterValue).toList().map((d) => d.monthNum).toList(),
                                                                            yData:
                                                                                perViolationGraphViolationSummaryRecordList.where((e) => e.year == _model.violationChartYearFilterValue).toList().map((d) => d.forecastedViolations).toList(),
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
                                                                            AxisBounds(),
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
                                                                              10.0,
                                                                          reservedSize:
                                                                              32.0,
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
                                                                              40.0,
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
                                                                            LegendEntry(FlutterFlowTheme.of(context).success,
                                                                                'Forecasted Data'),
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
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Top Violations - ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.outfit(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .violationMonthFilterValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.violationMonthFilterValue ??= dateTimeFormat(
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
                                                                    onChanged:
                                                                        (val) async {
                                                                      safeSetState(() =>
                                                                          _model.violationMonthFilterValue =
                                                                              val);
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    width:
                                                                        130.0,
                                                                    height:
                                                                        35.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.plusJakartaSans(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText:
                                                                        'Month',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        0.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ],
                                                              ),
                                                              FutureBuilder<
                                                                  List<
                                                                      MonthlySummaryRecord>>(
                                                                future:
                                                                    queryMonthlySummaryRecordOnce(
                                                                  queryBuilder: (monthlySummaryRecord) =>
                                                                      monthlySummaryRecord
                                                                          .where(
                                                                            'month',
                                                                            isEqualTo:
                                                                                _model.violationMonthFilterValue,
                                                                          )
                                                                          .where(
                                                                            'year',
                                                                            isEqualTo:
                                                                                _model.violationChartYearFilterValue,
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
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<MonthlySummaryRecord>
                                                                      containerMonthlySummaryRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final containerMonthlySummaryRecord = containerMonthlySummaryRecordList
                                                                          .isNotEmpty
                                                                      ? containerMonthlySummaryRecordList
                                                                          .first
                                                                      : null;

                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          ListView(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        primary:
                                                                            false,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final dashboardCardViolationName = (containerMonthlySummaryRecord?.violationName.toList() ?? []).take(5).toList();

                                                                                    return ListView.separated(
                                                                                      padding: EdgeInsets.zero,
                                                                                      primary: false,
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: dashboardCardViolationName.length,
                                                                                      separatorBuilder: (_, __) => SizedBox(height: 16.0),
                                                                                      itemBuilder: (context, dashboardCardViolationNameIndex) {
                                                                                        final dashboardCardViolationNameItem = dashboardCardViolationName[dashboardCardViolationNameIndex];
                                                                                        return Text(
                                                                                          dashboardCardViolationNameItem,
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                              ),
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final dashboardCardViolationCount = (containerMonthlySummaryRecord?.violationCount.toList() ?? []).take(5).toList();

                                                                                    return ListView.separated(
                                                                                      padding: EdgeInsets.zero,
                                                                                      primary: false,
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: dashboardCardViolationCount.length,
                                                                                      separatorBuilder: (_, __) => SizedBox(height: 16.0),
                                                                                      itemBuilder: (context, dashboardCardViolationCountIndex) {
                                                                                        final dashboardCardViolationCountItem = dashboardCardViolationCount[dashboardCardViolationCountIndex];
                                                                                        return Align(
                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                          child: Text(
                                                                                            dashboardCardViolationCountItem.toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                  font: GoogleFonts.plusJakartaSans(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                ),
                                                                                            overflow: TextOverflow.ellipsis,
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(height: 16.0)),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 16.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 16.0)),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Citations per brgy in Panabo - ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.outfit(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .brgyMonthFilterValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.brgyMonthFilterValue ??= dateTimeFormat(
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
                                                                    onChanged:
                                                                        (val) async {
                                                                      safeSetState(() =>
                                                                          _model.brgyMonthFilterValue =
                                                                              val);
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    width:
                                                                        130.0,
                                                                    height:
                                                                        35.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.plusJakartaSans(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText:
                                                                        'Month',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        0.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ],
                                                              ),
                                                              Expanded(
                                                                child: FutureBuilder<
                                                                    List<
                                                                        CitationRecord>>(
                                                                  future:
                                                                      queryCitationRecordOnce(
                                                                    queryBuilder: (citationRecord) => citationRecord
                                                                        .where(
                                                                          'appre_date_month',
                                                                          isEqualTo:
                                                                              _model.brgyMonthFilterValue,
                                                                        )
                                                                        .where(
                                                                          'appre_date_year',
                                                                          isEqualTo:
                                                                              _model.violationChartYearFilterValue,
                                                                        )
                                                                        .where(
                                                                          'violator_address_province',
                                                                          isEqualTo:
                                                                              'Davao Del Norte',
                                                                        )
                                                                        .where(
                                                                          'violator_address_city',
                                                                          isEqualTo:
                                                                              'Panabo City',
                                                                        ),
                                                                    limit: 5,
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
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<CitationRecord>
                                                                        containerCitationRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                final violationsPerBrgy = containerCitationRecordList.unique((e) => e.violatorAddressBrgy).toList();
                                                                                if (violationsPerBrgy.isEmpty) {
                                                                                  return IsEmptyCardWidget();
                                                                                }

                                                                                return FlutterFlowDataTable<CitationRecord>(
                                                                                  controller: _model.paginatedDataTableController,
                                                                                  data: violationsPerBrgy,
                                                                                  columnsBuilder: (onSortChanged) => [
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Text(
                                                                                          'Edit Header 1',
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                  dataRowBuilder: (violationsPerBrgyItem, violationsPerBrgyIndex, selected, onSelectChanged) => DataRow(
                                                                                    color: WidgetStateProperty.all(
                                                                                      violationsPerBrgyIndex % 2 == 0 ? FlutterFlowTheme.of(context).alternate : FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    cells: [
                                                                                      FutureBuilder<int>(
                                                                                        future: queryCitationRecordCount(
                                                                                          queryBuilder: (citationRecord) => citationRecord
                                                                                              .where(
                                                                                                'violator_address_brgy',
                                                                                                isEqualTo: violationsPerBrgyItem.violatorAddressBrgy,
                                                                                              )
                                                                                              .where(
                                                                                                'appre_date_month',
                                                                                                isEqualTo: _model.brgyMonthFilterValue,
                                                                                              )
                                                                                              .where(
                                                                                                'appre_date_year',
                                                                                                isEqualTo: '2024',
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
                                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                          int rowCount = snapshot.data!;

                                                                                          return Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                violationsPerBrgyItem.violatorAddressBrgy,
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
                                                                                                rowCount.toString(),
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
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ].map((c) => DataCell(c)).toList(),
                                                                                  ),
                                                                                  emptyBuilder: () => IsEmptyCardWidget(),
                                                                                  paginated: true,
                                                                                  selectable: false,
                                                                                  hidePaginator: false,
                                                                                  showFirstLastButtons: false,
                                                                                  headingRowHeight: 0.0,
                                                                                  dataRowHeight: 48.0,
                                                                                  columnSpacing: 20.0,
                                                                                  headingRowColor: FlutterFlowTheme.of(context).primary,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  addHorizontalDivider: false,
                                                                                  addTopAndBottomDivider: false,
                                                                                  hideDefaultHorizontalDivider: true,
                                                                                  addVerticalDivider: false,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 16.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 16.0)),
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
