import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({
    Key key,
    this.guess,
    this.result,
  }) : super(key: key);

  final int guess;
  final String result;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String _result = "Waiting for a number to check...";
  num _correctNumber = 13; // todo: randomize
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: AutoSizeText(
          'Guessing Game',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.secondaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your guess below:',
                style: FlutterFlowTheme.title2.override(
                  fontFamily: 'Poppins',
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment(0, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: TextFormField(
                      controller: textController,
                      obscureText: false,
                      onEditingComplete: () {
                        String guess = textController.text;
                        String result = getResult(guess);
                        setState(() => _result = result);
                      },
                      decoration: InputDecoration(
                        hintText: 'a number between 0 and 100',
                        hintStyle: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.primaryColor,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.primaryColor,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.subtitle1.override(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FFButtonWidget(
                onPressed: () {
                  String guess = textController.text;
                  String result = getResult(guess);
                  setState(() => _result = result);
                },
                text: 'Check',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.primaryColor,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _result,
                style: FlutterFlowTheme.title3.override(
                  fontFamily: 'Poppins',
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  String getResult(String guess) {
    if (guess.isEmpty) return "Empty input";
    int guessAsInteger = int.tryParse(guess);
    if (guessAsInteger == null) return "Invalid number $guess";
    if (guessAsInteger == _correctNumber) return "Correct!";
    return guessAsInteger > _correctNumber ? "Too High!" : "Too Low!";
  }
}
