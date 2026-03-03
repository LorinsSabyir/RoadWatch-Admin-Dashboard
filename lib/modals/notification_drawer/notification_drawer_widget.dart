import '/backend/backend.dart';
import '/components/confirm_modal/confirm_modal_widget.dart';
import '/components/is_empty_card/is_empty_card_widget.dart';
import '/components/notification_card/notification_card_widget.dart';
import '/components/view_enforcer/view_enforcer_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notification_drawer_model.dart';
export 'notification_drawer_model.dart';

class NotificationDrawerWidget extends StatefulWidget {
  const NotificationDrawerWidget({super.key});

  @override
  State<NotificationDrawerWidget> createState() =>
      _NotificationDrawerWidgetState();
}

class _NotificationDrawerWidgetState extends State<NotificationDrawerWidget>
    with TickerProviderStateMixin {
  late NotificationDrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationDrawerModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 0.0),
      child: Container(
        width: 430.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notifications',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                font: GoogleFonts.outfit(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(-1.0, 0),
                      child: FlutterFlowButtonTabBar(
                        useToggleButtonStyle: false,
                        isScrollable: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                        unselectedLabelStyle: TextStyle(),
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        backgroundColor: FlutterFlowTheme.of(context).accent1,
                        unselectedBackgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        borderColor: FlutterFlowTheme.of(context).primary,
                        unselectedBorderColor:
                            FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 12.0,
                        elevation: 0.0,
                        labelPadding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        buttonMargin:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 8.0),
                        tabs: [
                          Tab(
                            text: 'New',
                          ),
                          Tab(
                            text: 'All',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          StreamBuilder<List<AdminNotifRecord>>(
                            stream: queryAdminNotifRecord(
                              queryBuilder: (adminNotifRecord) =>
                                  adminNotifRecord
                                      .where(
                                        'status',
                                        isEqualTo: 'pending',
                                      )
                                      .where(
                                        'type',
                                        isEqualTo: 'system',
                                      )
                                      .orderBy('created_time',
                                          descending: true),
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
                              List<AdminNotifRecord>
                                  containerAdminNotifRecordList =
                                  snapshot.data!;

                              return ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    primary: false,
                                    controller: _model.columnController1,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((containerAdminNotifRecordList
                                                .isNotEmpty) ==
                                            true)
                                          Builder(
                                            builder: (context) {
                                              final newNotif =
                                                  containerAdminNotifRecordList
                                                      .toList();
                                              if (newNotif.isEmpty) {
                                                return IsEmptyCardWidget();
                                              }

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: newNotif.length,
                                                itemBuilder:
                                                    (context, newNotifIndex) {
                                                  final newNotifItem =
                                                      newNotif[newNotifIndex];
                                                  return Builder(
                                                    builder: (context) =>
                                                        InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  ViewEnforcerWidget(
                                                                enforcerRef:
                                                                    newNotifItem
                                                                        .enforcerId,
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .notificationCardModels1
                                                            .getModel(
                                                          newNotifIndex
                                                              .toString(),
                                                          newNotifIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            NotificationCardWidget(
                                                          key: Key(
                                                            'Keyqy8_${newNotifIndex.toString()}',
                                                          ),
                                                          status: newNotifItem
                                                              .status,
                                                          title: newNotifItem
                                                              .title,
                                                          subtitle: newNotifItem
                                                              .subtitle,
                                                          notifRef: newNotifItem
                                                              .reference,
                                                          enforcerRef:
                                                              newNotifItem
                                                                  .enforcerId,
                                                          confirmAct: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      ConfirmModalWidget(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                    title:
                                                                        'Confirm Account Creation',
                                                                    subtitle:
                                                                        'Confirm creation of this enforcer account?',
                                                                    button:
                                                                        'Confirm',
                                                                    buttonColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .success,
                                                                    primaryButtonAction:
                                                                        () async {
                                                                      await newNotifItem
                                                                          .reference
                                                                          .update(
                                                                              createAdminNotifRecordData(
                                                                        title:
                                                                            'Account Confirmed!',
                                                                        subtitle:
                                                                            'You can log in and start using the app.',
                                                                        status:
                                                                            'static',
                                                                        editedTime:
                                                                            getCurrentTimestamp,
                                                                        notifType:
                                                                            'Confirmation',
                                                                        type:
                                                                            'system',
                                                                      ));

                                                                      await newNotifItem
                                                                          .enforcerId!
                                                                          .update(
                                                                              createUsersRecordData(
                                                                        accStatus:
                                                                            'active',
                                                                      ));
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          deleteAct: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      ConfirmModalWidget(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .delete_forever,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                    title:
                                                                        'Confirm Deletion',
                                                                    subtitle:
                                                                        'Are you sure you want to delete this record? This action cannot be undone.',
                                                                    button:
                                                                        'Delete',
                                                                    buttonColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                    primaryButtonAction:
                                                                        () async {
                                                                      await newNotifItem
                                                                          .reference
                                                                          .delete();
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          rejectAct: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      ConfirmModalWidget(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                    title:
                                                                        'Reject Account Creation',
                                                                    subtitle:
                                                                        'Reject creation of this enforcer account?',
                                                                    button:
                                                                        'Reject',
                                                                    buttonColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                    primaryButtonAction:
                                                                        () async {
                                                                      await newNotifItem
                                                                          .reference
                                                                          .update(
                                                                              createAdminNotifRecordData(
                                                                        title:
                                                                            'Account Rejected!',
                                                                        subtitle:
                                                                            'You cannot log in and use the app!',
                                                                        status:
                                                                            'static',
                                                                        editedTime:
                                                                            getCurrentTimestamp,
                                                                        notifType:
                                                                            'Rejection',
                                                                        type:
                                                                            'system',
                                                                      ));

                                                                      await newNotifItem
                                                                          .enforcerId!
                                                                          .update(
                                                                              createUsersRecordData(
                                                                        accStatus:
                                                                            'rejected',
                                                                      ));
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          StreamBuilder<List<AdminNotifRecord>>(
                            stream: queryAdminNotifRecord(
                              queryBuilder: (adminNotifRecord) =>
                                  adminNotifRecord
                                      .where(
                                        'type',
                                        isEqualTo: 'system',
                                      )
                                      .orderBy('created_time',
                                          descending: true),
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
                              List<AdminNotifRecord>
                                  containerAdminNotifRecordList =
                                  snapshot.data!;

                              return ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    primary: false,
                                    controller: _model.columnController2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((containerAdminNotifRecordList
                                                .isNotEmpty) ==
                                            true)
                                          Builder(
                                            builder: (context) {
                                              final all =
                                                  containerAdminNotifRecordList
                                                      .toList();
                                              if (all.isEmpty) {
                                                return IsEmptyCardWidget();
                                              }

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: all.length,
                                                itemBuilder:
                                                    (context, allIndex) {
                                                  final allItem = all[allIndex];
                                                  return Builder(
                                                    builder: (context) =>
                                                        InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  ViewEnforcerWidget(
                                                                enforcerRef: allItem
                                                                    .enforcerId,
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .notificationCardModels2
                                                            .getModel(
                                                          allIndex.toString(),
                                                          allIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            NotificationCardWidget(
                                                          key: Key(
                                                            'Key03g_${allIndex.toString()}',
                                                          ),
                                                          status:
                                                              allItem.status,
                                                          title: allItem.title,
                                                          subtitle:
                                                              allItem.subtitle,
                                                          notifRef:
                                                              allItem.reference,
                                                          enforcerRef: allItem
                                                              .enforcerId,
                                                          confirmAct: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      ConfirmModalWidget(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                    title:
                                                                        'Confirm Account Creation',
                                                                    subtitle:
                                                                        'Confirm creation of this enforcer account?',
                                                                    button:
                                                                        'Confirm',
                                                                    buttonColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .success,
                                                                    primaryButtonAction:
                                                                        () async {
                                                                      await allItem
                                                                          .reference
                                                                          .update(
                                                                              createAdminNotifRecordData(
                                                                        title:
                                                                            'Account Confirmed!',
                                                                        subtitle:
                                                                            'You can log in and start using the app.',
                                                                        status:
                                                                            'static',
                                                                        editedTime:
                                                                            getCurrentTimestamp,
                                                                        notifType:
                                                                            'Confirmation',
                                                                        type:
                                                                            'system',
                                                                      ));

                                                                      await allItem
                                                                          .enforcerId!
                                                                          .update(
                                                                              createUsersRecordData(
                                                                        accStatus:
                                                                            'active',
                                                                      ));
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          deleteAct: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      ConfirmModalWidget(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .delete_forever,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                    title:
                                                                        'Confirm Deletion',
                                                                    subtitle:
                                                                        'Are you sure you want to delete this record? This action cannot be undone.',
                                                                    button:
                                                                        'Delete',
                                                                    buttonColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                    primaryButtonAction:
                                                                        () async {
                                                                      await allItem
                                                                          .reference
                                                                          .delete();
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          rejectAct: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      ConfirmModalWidget(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                    title:
                                                                        'Reject Account Creation',
                                                                    subtitle:
                                                                        'Reject creation of this enforcer account?',
                                                                    button:
                                                                        'Reject',
                                                                    buttonColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                    primaryButtonAction:
                                                                        () async {
                                                                      await allItem
                                                                          .reference
                                                                          .update(
                                                                              createAdminNotifRecordData(
                                                                        title:
                                                                            'Account Rejected!',
                                                                        subtitle:
                                                                            'You cannot log in and use the app!',
                                                                        status:
                                                                            'static',
                                                                        editedTime:
                                                                            getCurrentTimestamp,
                                                                        notifType:
                                                                            'Rejection',
                                                                        type:
                                                                            'system',
                                                                      ));

                                                                      await allItem
                                                                          .enforcerId!
                                                                          .update(
                                                                              createUsersRecordData(
                                                                        accStatus:
                                                                            'rejected',
                                                                      ));
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
