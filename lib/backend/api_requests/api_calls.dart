import 'api_manager.dart';

Future<dynamic> initializeCorrectGuessCall() => ApiManager.instance.makeApiCall(
      callName: 'Initialize Correct Guess',
      apiDomain: 'europe-central2-guessing-game-backend.cloudfunctions.net',
      apiEndpoint: 'GetRandomNumber',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnResponse: true,
    );

Future<dynamic> getGuessResultCall({
  String guess = '0',
  String answer = '0',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Get Guess Result',
      apiDomain: 'europe-central2-guessing-game-backend.cloudfunctions.net',
      apiEndpoint: 'check-guess',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'guess': guess,
        'answer': answer,
      },
      returnResponse: true,
    );
