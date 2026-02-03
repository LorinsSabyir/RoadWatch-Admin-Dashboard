import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CreateUserByAdminCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = 'user123',
    String? displayName = '',
    String? lastName = '',
    String? gender = '',
    String? phoneNumber = '',
    String? badgeNumber = '',
    String? accStatus = 'active',
    String? role = 'user',
    bool? status = true,
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}",
  "display_name": "${escapeStringForJson(displayName)}",
  "last_name": "${escapeStringForJson(lastName)}",
  "gender": "${escapeStringForJson(gender)}",
  "phone_number": "${escapeStringForJson(phoneNumber)}",
  "badge_number": "${escapeStringForJson(badgeNumber)}",
  "acc_status": "${escapeStringForJson(accStatus)}",
  "role": "${escapeStringForJson(role)}",
  "status": ${status}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createUserByAdmin',
      apiUrl:
          'https://create-user-by-admin-972099236659.asia-southeast1.run.app',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
