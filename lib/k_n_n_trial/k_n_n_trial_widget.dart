import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'k_n_n_trial_model.dart';
export 'k_n_n_trial_model.dart';

class KNNTrialWidget extends StatefulWidget {
  const KNNTrialWidget({
    Key? key,
    int? number,
    int? maxSodium,
    int? maxSugar,
    int? maxSaturatedFat,
  })  : this.number = number ?? 10,
        this.maxSodium = maxSodium ?? 5,
        this.maxSugar = maxSugar ?? 5,
        this.maxSaturatedFat = maxSaturatedFat ?? 3,
        super(key: key);

  final int number;
  final int maxSodium;
  final int maxSugar;
  final int maxSaturatedFat;

  @override
  _KNNTrialWidgetState createState() => _KNNTrialWidgetState();
}

class _KNNTrialWidgetState extends State<KNNTrialWidget> {
  late KNNTrialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KNNTrialModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Recipes',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: Colors.white,
                  fontSize: 22.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              GoRouter.of(context).prepareAuthEvent();
              await authManager.signOut();
              GoRouter.of(context).clearRedirectLocation();

              context.goNamedAuth('Onboarding', mounted);
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FutureBuilder<ApiCallResponse>(
                  future: (_model
                          .apiRequestCompleter ??= Completer<ApiCallResponse>()
                        ..complete(RecipesCall.call(
                          number: widget.number,
                          maxSaturatedFat: widget.maxSaturatedFat.toDouble(),
                          maxSugar: widget.maxSugar.toDouble(),
                          maxSodium: widget.maxSodium.toDouble(),
                        )))
                      .future,
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
                        return RefreshIndicator(
                          onRefresh: () async {
                            setState(() => _model.apiRequestCompleter = null);
                            await _model.waitForApiRequestCompleted();
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: recipes.length,
                            itemBuilder: (context, recipesIndex) {
                              final recipesItem = recipes[recipesIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image.network(
                                    getJsonField(
                                      recipesItem,
                                      r'''$.image''',
                                    ),
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    getJsonField(
                                      recipesItem,
                                      r'''$.title''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              );
                            },
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
      ),
    );
  }
}
