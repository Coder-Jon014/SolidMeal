import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<IllnessesRecord>>(
        stream: queryIllnessesRecord(
          queryBuilder: (illnessesRecord) => illnessesRecord.where('illness',
              isEqualTo: valueOrDefault(currentUserDocument?.userIllness, '')),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 150.0,
                height: 150.0,
                child: SpinKitPulse(
                  color: Color(0xFF4B39EF),
                  size: 150.0,
                ),
              ),
            );
          }
          List<IllnessesRecord> homeIllnessesRecordList = snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final homeIllnessesRecord = homeIllnessesRecordList.isNotEmpty
              ? homeIllnessesRecordList.first
              : null;
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Color(0xFFF1F4F8),
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                title: Text(
                  'Welcome, ${valueOrDefault(currentUserDocument?.firstName, '')}',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
                ),
                actions: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.person,
                        color: Color(0xFF0082A3),
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('onboarding1');
                      },
                    ),
                  ),
                ],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: StreamBuilder<List<UserFavoriteRecord>>(
                stream: queryUserFavoriteRecord(
                  queryBuilder: (userFavoriteRecord) => userFavoriteRecord
                      .where('userId', isEqualTo: currentUserUid),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 150.0,
                        height: 150.0,
                        child: SpinKitPulse(
                          color: Color(0xFF4B39EF),
                          size: 150.0,
                        ),
                      ),
                    );
                  }
                  List<UserFavoriteRecord> columnUserFavoriteRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final columnUserFavoriteRecord =
                      columnUserFavoriteRecordList.isNotEmpty
                          ? columnUserFavoriteRecordList.first
                          : null;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                color: Color(0x27000000),
                                offset: Offset(0.0, 3.0),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Search products...',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF57636C),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF14181B),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              maxLines: null,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                child: Text(
                                  'Cuisines',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF57636C),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 50.6,
                          decoration: BoxDecoration(),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 0.0, 8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'MoreCuisine',
                                      queryParams: {
                                        'cuisine': serializeParam(
                                          'Italian',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: 96.2,
                                    height: 119.9,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x230E151B),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Caribbean',
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 20.2,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF0082A3),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 8.0, 0.0, 8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'MoreCuisine',
                                      queryParams: {
                                        'cuisine': serializeParam(
                                          'Chinese',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: 120.0,
                                    height: 190.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x230E151B),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Italian',
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF0082A3),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 8.0, 0.0, 8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'MoreCuisine',
                                      queryParams: {
                                        'cuisine': serializeParam(
                                          'Caribbean',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: 120.0,
                                    height: 190.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x230E151B),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Chinese',
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF0082A3),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                child: Text(
                                  'Breakfast Picks',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF57636C),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'MoreMealTypes',
                                    queryParams: {
                                      'type': serializeParam(
                                        'Breakfast',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Text(
                                  'See More',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF14181B),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 199.9,
                          decoration: BoxDecoration(),
                          child: FutureBuilder<ApiCallResponse>(
                            future: RecipesCall.call(
                              maxSaturatedFat: valueOrDefault<double>(
                                homeIllnessesRecord!.targetSaturatedFat
                                    ?.toDouble(),
                                100.0,
                              ),
                              maxSugar: valueOrDefault<double>(
                                homeIllnessesRecord!.targetSugar?.toDouble(),
                                100.0,
                              ),
                              maxSodium: valueOrDefault<double>(
                                homeIllnessesRecord!.targetSodium?.toDouble(),
                                100.0,
                              ),
                              number: 20,
                              type: 'Breakfast',
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 150.0,
                                    height: 150.0,
                                    child: SpinKitPulse(
                                      color: Color(0xFF4B39EF),
                                      size: 150.0,
                                    ),
                                  ),
                                );
                              }
                              final listViewRecipesResponse = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final recipes = RecipesCall.recipes(
                                        listViewRecipesResponse.jsonBody,
                                      )?.toList() ??
                                      [];
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: recipes.length,
                                    itemBuilder: (context, recipesIndex) {
                                      final recipesItem = recipes[recipesIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'DetailsScreen',
                                              queryParams: {
                                                'recipeId': serializeParam(
                                                  getJsonField(
                                                    recipesItem,
                                                    r'''$.id''',
                                                  ),
                                                  ParamType.int,
                                                ),
                                                'recipeInfo': serializeParam(
                                                  recipesItem,
                                                  ParamType.JSON,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.421,
                                            height: 204.2,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x230E151B),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.network(
                                                      getJsonField(
                                                        recipesItem,
                                                        r'''$.image''',
                                                      ),
                                                      width: double.infinity,
                                                      height: 77.4,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            recipesItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                fontSize: 11.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Stack(
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final userFavoriteUpdateData =
                                                                  {
                                                                'recipeId':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  getJsonField(
                                                                    recipesItem,
                                                                    r'''$.id''',
                                                                  )
                                                                ]),
                                                              };
                                                              await columnUserFavoriteRecord!
                                                                  .reference
                                                                  .update(
                                                                      userFavoriteUpdateData);
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .favorite_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                child: Text(
                                  'Snack Picks',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF57636C),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'MoreMealTypes',
                                    queryParams: {
                                      'type': serializeParam(
                                        'Snack',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Text(
                                  'See More',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF14181B),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 199.9,
                          decoration: BoxDecoration(),
                          child: FutureBuilder<ApiCallResponse>(
                            future: RecipesCall.call(
                              maxSaturatedFat: valueOrDefault<double>(
                                homeIllnessesRecord!.targetSaturatedFat
                                    ?.toDouble(),
                                100.0,
                              ),
                              maxSugar: valueOrDefault<double>(
                                homeIllnessesRecord!.targetSugar?.toDouble(),
                                100.0,
                              ),
                              maxSodium: valueOrDefault<double>(
                                homeIllnessesRecord!.targetSodium?.toDouble(),
                                100.0,
                              ),
                              number: 20,
                              type: 'Snack',
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 150.0,
                                    height: 150.0,
                                    child: SpinKitPulse(
                                      color: Color(0xFF4B39EF),
                                      size: 150.0,
                                    ),
                                  ),
                                );
                              }
                              final listViewRecipesResponse = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final recipes = RecipesCall.recipes(
                                        listViewRecipesResponse.jsonBody,
                                      )?.toList() ??
                                      [];
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: recipes.length,
                                    itemBuilder: (context, recipesIndex) {
                                      final recipesItem = recipes[recipesIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'DetailsScreen',
                                              queryParams: {
                                                'recipeId': serializeParam(
                                                  getJsonField(
                                                    recipesItem,
                                                    r'''$.id''',
                                                  ),
                                                  ParamType.int,
                                                ),
                                                'recipeInfo': serializeParam(
                                                  recipesItem,
                                                  ParamType.JSON,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.421,
                                            height: 204.2,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x230E151B),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.network(
                                                      getJsonField(
                                                        recipesItem,
                                                        r'''$.image''',
                                                      ),
                                                      width: double.infinity,
                                                      height: 77.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            recipesItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                fontSize: 11.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Stack(
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.favorite,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                child: Text(
                                  'Dessert Picks',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF57636C),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'MoreMealTypes',
                                    queryParams: {
                                      'type': serializeParam(
                                        'Dessert',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Text(
                                  'See More',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF14181B),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 199.9,
                          decoration: BoxDecoration(),
                          child: FutureBuilder<ApiCallResponse>(
                            future: RecipesCall.call(
                              maxSaturatedFat: valueOrDefault<double>(
                                homeIllnessesRecord!.targetSaturatedFat
                                    ?.toDouble(),
                                100.0,
                              ),
                              maxSugar: valueOrDefault<double>(
                                homeIllnessesRecord!.targetSugar?.toDouble(),
                                100.0,
                              ),
                              maxSodium: valueOrDefault<double>(
                                homeIllnessesRecord!.targetSodium?.toDouble(),
                                100.0,
                              ),
                              number: 20,
                              type: 'Dessert',
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 150.0,
                                    height: 150.0,
                                    child: SpinKitPulse(
                                      color: Color(0xFF4B39EF),
                                      size: 150.0,
                                    ),
                                  ),
                                );
                              }
                              final listViewRecipesResponse = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final recipes = RecipesCall.recipes(
                                        listViewRecipesResponse.jsonBody,
                                      )?.toList() ??
                                      [];
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: recipes.length,
                                    itemBuilder: (context, recipesIndex) {
                                      final recipesItem = recipes[recipesIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'DetailsScreen',
                                              queryParams: {
                                                'recipeId': serializeParam(
                                                  getJsonField(
                                                    recipesItem,
                                                    r'''$.id''',
                                                  ),
                                                  ParamType.int,
                                                ),
                                                'recipeInfo': serializeParam(
                                                  recipesItem,
                                                  ParamType.JSON,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.421,
                                            height: 204.2,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x230E151B),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 4.0, 4.0, 4.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.network(
                                                      getJsonField(
                                                        recipesItem,
                                                        r'''$.image''',
                                                      ),
                                                      width: double.infinity,
                                                      height: 77.4,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            recipesItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                fontSize: 11.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Stack(
                                                    children: [
                                                      Icon(
                                                        Icons.favorite,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Text(
                          homeIllnessesRecord!.illness!,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Text(
                          homeIllnessesRecord!.targetSaturatedFat!.toString(),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Text(
                          homeIllnessesRecord!.targetSodium!.toString(),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
