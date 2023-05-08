import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class RecipesCall {
  static Future<ApiCallResponse> call({
    double? maxSaturatedFat = 100,
    int? number = 100,
    double? maxSugar = 100,
    double? maxSodium = 100,
    String? type = 'none',
    double? maxCalories = 800,
    String? cuisine = 'none',
    String? excludeCuisine = 'none',
    String? diet = 'none',
    String? intolerances = 'none',
    String? includeIngredients = 'none',
    String? excludeIngredients = 'none',
    String? titleMatch = 'none',
    double? maxProtein = 100,
    double? maxCarbs = 100,
    double? maxFat = 100,
    double? maxCalcium = 100,
    double? maxCholesterol = 100,
    double? maxFluoride = 100,
    double? maxVitaminA = 100,
    double? minVitaminA = 0,
    double? maxVitaminB = 100,
    double? minVitaminB = 0,
    double? minVitaminC = 0,
    double? minSugar = 0,
    double? minPotassium = 0,
    double? maxPotassium = 100,
    double? maxFiber = 100,
    double? minFiber = 0,
    double? maxVitaminC = 100,
    String? query = 'pasta',
    bool? testcase1 = true,
    bool? testcase2 = true,
    bool? testcase3 = true,
    bool? limitLicense = true,
    bool? instructionsRequired = false,
    bool? addRecipeInformation = false,
    bool? testCase4,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Recipes',
      apiUrl:
          'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/complexSearch',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': '92d155dd53msh7f93ade944b4736p19d9f0jsne5b6faf7387d',
        'X-RapidAPI-Host':
            'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
      },
      params: {
        'query': query,
        'maxSugar': maxSugar,
        'number': number,
        'maxSaturatedFat': maxSaturatedFat,
        'type': type,
        'maxCalories': maxCalories,
        'cuisine': cuisine,
        'excludeCuisine': excludeCuisine,
        'diet': diet,
        'intolerances': intolerances,
        'includeIngredients': includeIngredients,
        'excludeIngredients': excludeIngredients,
        'maxProtein': maxProtein,
        'maxCarbs': maxCarbs,
        'maxFat': maxFat,
        'maxCalcium': maxCalcium,
        'maxCholesterol': maxCholesterol,
        'maxFluoride': maxFluoride,
        'maxVitaminA': maxVitaminA,
        'minVitaminA': minVitaminA,
        'maxVitaminB': maxVitaminB,
        'minVitaminB': minVitaminB,
        'minVitaminC': minVitaminC,
        'maxVitaminC': maxVitaminC,
        'minFiber': minFiber,
        'maxFiber': maxFiber,
        'maxPotassium': maxPotassium,
        'minPotassium': minPotassium,
        'minSugar': minSugar,
        'maxSodium': maxSodium,
        'limitLicense': limitLicense,
        'instructionsRequired': instructionsRequired,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic recipes(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.results[:].id''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.results[:].title''',
        true,
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.results[:].image''',
        true,
      );
}

class RecipeInfoCall {
  static Future<ApiCallResponse> call({
    int? ids,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'RecipeInfo',
      apiUrl:
          'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/informationBulk',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': '92d155dd53msh7f93ade944b4736p19d9f0jsne5b6faf7387d',
        'X-RapidAPI-Host':
            'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
      },
      params: {
        'ids': ids,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic preparationTime(dynamic response) => getJsonField(
        response,
        r'''$[:].preparationMinutes''',
      );
  static dynamic cookingTime(dynamic response) => getJsonField(
        response,
        r'''$[:].cookingMinutes''',
      );
  static dynamic instructions(dynamic response) => getJsonField(
        response,
        r'''$[:].analyzedInstructions[:].steps[:].step''',
        true,
      );
  static dynamic instructionsNumber(dynamic response) => getJsonField(
        response,
        r'''$[:].analyzedInstructions[:].steps[:].number''',
        true,
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$[:].image''',
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$[:].title''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
