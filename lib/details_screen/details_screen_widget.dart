import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'details_screen_model.dart';
export 'details_screen_model.dart';

class DetailsScreenWidget extends StatefulWidget {
  const DetailsScreenWidget({
    Key? key,
    required this.recipeId,
    required this.recipeInfo,
  }) : super(key: key);

  final int? recipeId;
  final dynamic recipeInfo;

  @override
  _DetailsScreenWidgetState createState() => _DetailsScreenWidgetState();
}

class _DetailsScreenWidgetState extends State<DetailsScreenWidget> {
  late DetailsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: RecipeInfoCall.call(
        ids: widget.recipeId,
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
        final detailsScreenRecipeInfoResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF1F4F8),
          body: ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 240.0,
                          child: Stack(
                            alignment: AlignmentDirectional(-0.95, -0.7),
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Image.network(
                                  getJsonField(
                                    widget.recipeInfo,
                                    r'''$.image''',
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height: 240.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.95, -0.55),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pop();
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFFF5F5F5),
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Icon(
                                        Icons.arrow_back_rounded,
                                        color: Color(0xFF4B39EF),
                                        size: 24.0,
                                      ),
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recipe',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: AutoSizeText(
                                getJsonField(
                                  widget.recipeInfo,
                                  r'''$.title''',
                                ).toString(),
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF090F13),
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Coffee (g)',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                '${getJsonField(
                                  widget.recipeInfo,
                                  r'''$.nutrition.nutrients[0].amount''',
                                ).toString()} ${getJsonField(
                                  widget.recipeInfo,
                                  r'''$.nutrition.nutrients[0].unit''',
                                ).toString()}',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF090F13),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Water (g)',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  '${getJsonField(
                                    widget.recipeInfo,
                                    r'''$.nutrition.nutrients[1].amount''',
                                  ).toString()} ${getJsonField(
                                    widget.recipeInfo,
                                    r'''$.nutrition.nutrients[1].unit''',
                                  ).toString()}',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ratio',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  '${getJsonField(
                                    widget.recipeInfo,
                                    r'''$.nutrition.nutrients[2].amount''',
                                  ).toString()} ${getJsonField(
                                    widget.recipeInfo,
                                    r'''$.nutrition.nutrients[2].unit''',
                                  ).toString()}',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ratio',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  '${getJsonField(
                                    widget.recipeInfo,
                                    r'''$.nutrition.nutrients[3].amount''',
                                  ).toString()} ${getJsonField(
                                    widget.recipeInfo,
                                    r'''$.nutrition.nutrients[3].unit''',
                                  ).toString()}',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Prep Time',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  RecipeInfoCall.preparationTime(
                                    detailsScreenRecipeInfoResponse.jsonBody,
                                  ).toString(),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
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
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rating',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      '6',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF090F13),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.star_rate_rounded,
                                      color: Color(0xFF4B39EF),
                                      size: 32.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cooking Time',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  RecipeInfoCall.cookingTime(
                                    detailsScreenRecipeInfoResponse.jsonBody,
                                  ).toString(),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
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
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Grinder Used',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  'Ode Grinder',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
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
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Coffee Notes',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  'The coffee was decent with notes of caramel, lemongrass, slight hit of berry.\n',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  final instructions =
                                      (RecipeInfoCall.instructions(
                                            detailsScreenRecipeInfoResponse
                                                .jsonBody,
                                          ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList()
                                              ?.map((e) => e)
                                              .toList()
                                              ?.toList() ??
                                          [];
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: instructions.length,
                                    itemBuilder: (context, instructionsIndex) {
                                      final instructionsItem =
                                          instructions[instructionsIndex];
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            instructionsItem,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
