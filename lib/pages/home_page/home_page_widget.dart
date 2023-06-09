import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'KNNTrial',
                    queryParams: {
                      'number': serializeParam(
                        10,
                        ParamType.int,
                      ),
                      'maxSodium': serializeParam(
                        3,
                        ParamType.int,
                      ),
                      'maxSugar': serializeParam(
                        4,
                        ParamType.int,
                      ),
                      'maxSaturatedFat': serializeParam(
                        2,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Container(
                  width: 400.0,
                  height: 900.0,
                  child: custom_widgets.KnnRecipeComparison(
                    width: 400.0,
                    height: 900.0,
                    targetSodium: 114.0,
                    targetSugar: 9.0,
                    targetSaturatedFat: 8.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
