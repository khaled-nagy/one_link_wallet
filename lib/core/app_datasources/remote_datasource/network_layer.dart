import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:one_link_wallet/core/app_constants/app_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../exceptions/app_exceptions.dart';
import 'network_enums.dart';

abstract class MyClient {
  Future<Either<Exception, Map<String, dynamic>>> request({
    required RequestMethod requestMethod,
    required String url,
    Map<String, dynamic> params = const {},
    Map<String, String> headers = const {},
    Map<String, dynamic> body = const {},
    List<String> files = const [],
    String? filesName,
    int? timeoutInSeconds,
    bool encodeBodyToJson = true,
    bool forceFormData = false,
  });
}

class MyClientImpl implements MyClient {
  @override
  Future<Either<Exception, Map<String, dynamic>>> request({
    required RequestMethod requestMethod,
    required String url,
    Map<String, dynamic> params = const {},
    Map<String, String> headers = const {},
    Map<String, dynamic> body = const {},
    List<String> files = const [],
    String? filesName,
    String? fileType,
    int? timeoutInSeconds,
    bool encodeBodyToJson = true,
    bool forceFormData = false,
  }) async {
    final http.BaseRequest request;

    if (params.isNotEmpty) {
      url =
          '$url?${params.entries.map((map) => map.value is Iterable ? map.value.map((value) => '${map.key}=$value').join('&') : '${map.key}=${map.value}').join('&')}';
    }

    if (files.isNotEmpty || forceFormData) {
      request = http.MultipartRequest(requestMethod.name, Uri.parse(url));
      request as http.MultipartRequest;

      if (body.isNotEmpty) {
        final newBody =
            body.map((key, value) => MapEntry(key, value.toString()));
        request.fields.addAll(newBody);
      }
      for (String filePath in files) {
        request.files.add(
          await http.MultipartFile.fromPath(
            filesName!,
            filePath,
            contentType:
                fileType != null ? MediaType(filesName, fileType) : null,
          ),
        );
      }
    } else {
      request = http.Request(requestMethod.name, Uri.parse(url));
      request as http.Request;
      if (body.isNotEmpty) {
        if (encodeBodyToJson) {
          request.body = jsonEncode(body);
        } else {
          final newBody =
              body.map((key, value) => MapEntry(key, value.toString()));
          request.bodyFields = newBody;
        }
      }
    }

    request.headers.addAll(headers);

    try {
      final http.StreamedResponse response = await request
          .send()
          .timeout(Duration(seconds: timeoutInSeconds ?? 50));

      final int statusCode = response.statusCode;

      if (statusCode == 204) {
        _log(
          url,
          requestMethod,
          headers,
          body,
          filesName ?? 'No File',
          files,
          statusCode.toString(),
          '                        ',
        );
        return const Right({});
      }

      final result = jsonDecode(await response.stream.bytesToString());
      final Map<String, dynamic> responseBody =
          result is Map<String, dynamic> ? result : {'result': result};

      _log(
          url,
          requestMethod,
          headers,
          body,
          filesName ?? 'No File',
          files,
          statusCode.toString(),
          const JsonEncoder.withIndent('   ').convert(responseBody));

      if (statusCode > 199 && statusCode < 300) {
        if (responseBody['error'] != null) {
          return Left(InternalServerException());
        }
        return Right(responseBody);
      } else {
        final message = responseBody['error'] is String
            ? responseBody['error']
            : responseBody['error'] is Map
                ? responseBody['error']['message']
                : null;

        if (statusCode > 499) {
          return Left(InternalServerException());
        }
        if (statusCode == 401) {
          return Left(AuthException(error: message));
        }
        if (statusCode == 403) {
          return Left(ForbiddenException(error: message));
        }
        if (message != null &&
            url.contains('cart') &&
            (message.contains('No such entity') ||
                message.contains('does not have an active cart'))) {
          return Left(InvalidCartException());
        }
        return Left(
            ExceptionWithMessage(message ?? "unknown exception happened"));
      }
    } on SocketException catch (_) {
      _log(url, requestMethod, headers, body, filesName ?? 'noFiles', files,
          'unknown', 'Socket Exception happened');

      return Left(NetworkException());
    } on TimeoutException catch (_) {
      _log(url, requestMethod, headers, body, filesName ?? 'noFiles', files,
          'unknown', 'time out exception happened');
      return Left(TimeoutException());
    } catch (e) {
      _log(url, requestMethod, headers, body, filesName ?? 'noFiles', files,
          'unknown', e.toString());

      return Left(UnknownException());
    }
  }

  _log(
      String url,
      RequestMethod requestType,
      Map<String, dynamic> headers,
      Map<String, dynamic> body,
      String filesName,
      List<String> files,
      String statusCode,
      String response) {
    log('''
 Request URL ${requestType.name}
 $url
 Request Headers
 ${const JsonEncoder.withIndent('   ').convert(headers)}
Request Body 
 ${const JsonEncoder.withIndent('   ').convert(body)}
request files $filesName 
 $files
 
response body {$statusCode}
 $response
''');
  }
}
