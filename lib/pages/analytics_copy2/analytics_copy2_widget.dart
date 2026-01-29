import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modals/side_nav/side_nav_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'analytics_copy2_model.dart';
export 'analytics_copy2_model.dart';

class AnalyticsCopy2Widget extends StatefulWidget {
  const AnalyticsCopy2Widget({super.key});

  static String routeName = 'AnalyticsCopy2';
  static String routePath = '/AnalyticsCopy1';

  @override
  State<AnalyticsCopy2Widget> createState() => _AnalyticsCopy2WidgetState();
}

class _AnalyticsCopy2WidgetState extends State<AnalyticsCopy2Widget> {
  late AnalyticsCopy2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnalyticsCopy2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().searchIsActive = false;
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
        title: 'AnalyticsCopy2',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) => wrapWithModel(
                      model: _model.sideNavModel,
                      updateCallback: () => safeSetState(() {}),
                      child: SideNavWidget(
                        selectedNav: 2,
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
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Analytics',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  font: GoogleFonts.outfit(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Get insights and solutions for common traffic problems.',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts
                                                      .plusJakartaSans(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    StreamBuilder<List<MonthlySummaryRecord>>(
                                      stream: queryMonthlySummaryRecord(),
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
                                        List<MonthlySummaryRecord>
                                            downloadCSVButtonMonthlySummaryRecordList =
                                            snapshot.data!;

                                        return FFButtonWidget(
                                          onPressed: () async {
                                            await actions
                                                .monthlySummaryExportToCSV(
                                              context,
                                            );
                                          },
                                          text: 'Download CSV',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts
                                                          .plusJakartaSans(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: StreamBuilder<
                                          List<MonthlySummaryRecord>>(
                                        stream: queryMonthlySummaryRecord(
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
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
                                          List<MonthlySummaryRecord>
                                              graphMonthlySummaryRecordList =
                                              snapshot.data!;
                                          final graphMonthlySummaryRecord =
                                              graphMonthlySummaryRecordList
                                                      .isNotEmpty
                                                  ? graphMonthlySummaryRecordList
                                                      .first
                                                  : null;

                                          return Container(
                                            height: 400.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Violation Chart - ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
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
                                                            '2025',
                                                            '2026',
                                                            '2025',
                                                            '2024',
                                                            '2023',
                                                            '2022',
                                                            '2021',
                                                            '2020',
                                                            '2012'
                                                          ],
                                                          onChanged:
                                                              (val) async {
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
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
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
                                                              safeSetState(
                                                                  () {});
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
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: false,
                                                            isSearchable: false,
                                                            isMultiSelect:
                                                                false,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        1.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 350.0,
                                                              child:
                                                                  FlutterFlowBarChart(
                                                                barData: [
                                                                  FFBarChartData(
                                                                    yData: graphMonthlySummaryRecord!
                                                                        .violationCount,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                  )
                                                                ],
                                                                xLabels:
                                                                    graphMonthlySummaryRecord
                                                                        .violationName,
                                                                barWidth: 32.0,
                                                                barBorderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                groupSpace: 8.0,
                                                                alignment:
                                                                    BarChartAlignment
                                                                        .spaceAround,
                                                                chartStylingInfo:
                                                                    ChartStylingInfo(
                                                                  enableTooltip:
                                                                      true,
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  showGrid:
                                                                      true,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  borderWidth:
                                                                      1.0,
                                                                ),
                                                                axisBounds:
                                                                    AxisBounds(),
                                                                xAxisLabelInfo:
                                                                    AxisLabelInfo(
                                                                  title:
                                                                      'Months',
                                                                  titleTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .plusJakartaSans(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
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
                                                                  showLabels:
                                                                      true,
                                                                  labelTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .plusJakartaSans(
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
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
                                                                  titleTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .plusJakartaSans(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
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
                                                                  showLabels:
                                                                      true,
                                                                  labelTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .plusJakartaSans(
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                  labelInterval:
                                                                      100.0,
                                                                  reservedSize:
                                                                      100.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: StreamBuilder<
                                              List<MonthlySummaryRecord>>(
                                            stream: queryMonthlySummaryRecord(
                                              queryBuilder:
                                                  (monthlySummaryRecord) =>
                                                      monthlySummaryRecord
                                                          .where(
                                                            'year',
                                                            isEqualTo: _model
                                                                .violationChartYearFilterValue,
                                                          )
                                                          .where(
                                                            'month',
                                                            isEqualTo: _model
                                                                .violationChartMonthFilterValue,
                                                          ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
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
                                              List<MonthlySummaryRecord>
                                                  violationTableMonthlySummaryRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final violationTableMonthlySummaryRecord =
                                                  violationTableMonthlySummaryRecordList
                                                          .isNotEmpty
                                                      ? violationTableMonthlySummaryRecordList
                                                          .first
                                                      : null;

                                              return Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 3.0,
                                                      color: Color(0x35000000),
                                                      offset: Offset(
                                                        0.0,
                                                        1.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
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
                                                      Container(
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                flex: 3,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        '#',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              font: GoogleFonts.plusJakartaSans(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 3,
                                                                      child:
                                                                          Text(
                                                                        'Violation Title',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              font: GoogleFonts.plusJakartaSans(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 2,
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Citations Issued',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.plusJakartaSans(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Total',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.plusJakartaSans(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                flex: 3,
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final violationName =
                                                                        violationTableMonthlySummaryRecord?.violationName.toList() ??
                                                                            [];

                                                                    return ListView
                                                                        .separated(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          violationName
                                                                              .length,
                                                                      separatorBuilder: (_,
                                                                              __) =>
                                                                          SizedBox(
                                                                              height: 16.0),
                                                                      itemBuilder:
                                                                          (context,
                                                                              violationNameIndex) {
                                                                        final violationNameItem =
                                                                            violationName[violationNameIndex];
                                                                        return Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              phone: false,
                                                                              tablet: false,
                                                                            ))
                                                                              Expanded(
                                                                                flex: 1,
                                                                                child: Text(
                                                                                  violationNameIndex.toString(),
                                                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                        font: GoogleFonts.plusJakartaSans(
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            Expanded(
                                                                              flex: 3,
                                                                              child: Text(
                                                                                violationNameItem,
                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                      font: GoogleFonts.plusJakartaSans(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 2,
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final violationCount =
                                                                        violationTableMonthlySummaryRecord?.violationCount.toList() ??
                                                                            [];

                                                                    return ListView
                                                                        .separated(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          violationCount
                                                                              .length,
                                                                      separatorBuilder: (_,
                                                                              __) =>
                                                                          SizedBox(
                                                                              height: 16.0),
                                                                      itemBuilder:
                                                                          (context,
                                                                              violationCountIndex) {
                                                                        final violationCountItem =
                                                                            violationCount[violationCountIndex];
                                                                        return Visibility(
                                                                          visible:
                                                                              responsiveVisibility(
                                                                            context:
                                                                                context,
                                                                            phone:
                                                                                false,
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              violationCountItem.toString(),
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    font: GoogleFonts.plusJakartaSans(
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              if (responsiveVisibility(
                                                                context:
                                                                    context,
                                                                phone: false,
                                                                tablet: false,
                                                              ))
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        violationTableMonthlySummaryRecord
                                                                            ?.totalViolations
                                                                            .toString(),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.plusJakartaSans(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ].divide(SizedBox(height: 32.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
