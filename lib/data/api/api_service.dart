import 'dart:convert';
import 'dart:io';

import 'package:e_commerce_mvvm/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';

class DioClient extends GetxService {
  final String? appBaseUrl;
  final dio.Dio _dio = Dio();
  final SharedPreferences sharedPreferences;
  static const String noInternetMessage =
      'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 30;
  String? token;

  dio.FormData formData = dio.FormData.fromMap({
    "key": "value",
  });

  DioClient({required this.appBaseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString(AppConstants.token);
    _dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<dio.Response> getData(String uri, {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $uri\n====> Header: ${_dio.options.headers}');

      final response = await _dio.get(
        appBaseUrl! + uri,
        queryParameters: query,
        options: Options(headers: headers ?? _dio.options.headers),
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      debugPrint("Error in getData: $e");
      return dio.Response(
        requestOptions: dio.RequestOptions(path: uri),
        statusCode: 1,
        statusMessage: "Request failed",
      );
    }
  }

  Future<dio.Response> postData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: ${_dio.options.headers}');
      debugPrint('====> API Body: $body');
      final response = await _dio.post(
        appBaseUrl! + uri,
        data: jsonEncode(body),
        options: Options(headers: headers ?? _dio.options.headers),
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return dio.Response(requestOptions: RequestOptions(path: uri))..statusCode = 1;
    }
  }

  Future<dio.Response> postMultipartData(
      String uri, Map<String, String> body, List<MultipartBody> multipartBody,
      {Map<String, String>? headers}) async {
    try {
      dio.FormData formData = dio.FormData(); // Explicitly use Dio's FormData

      for (MultipartBody multipart in multipartBody) {
        if (kIsWeb) {
          Uint8List _list = await multipart.file.readAsBytes();
          formData.files.add(MapEntry(
            multipart.key,
            dio.MultipartFile.fromBytes(
              _list,
              filename: multipart.file.path,
              contentType: dio.DioMediaType('image', "jpg")
            ),
          ));
        } else {
          File _file = File(multipart.file.path);
          formData.files.add(MapEntry(
            multipart.key,
            await dio.MultipartFile.fromFile(
              _file.path,
              filename: _file.path.split('/').last,
            ),
          ));
        }
      }

      // Add fields
      formData.fields.addAll(body.entries.map((e) => MapEntry(e.key, e.value)));

      final response = await _dio.post(
        appBaseUrl! + uri,
        data: formData,
        options: dio.Options(headers: headers ?? _dio.options.headers),
      ).timeout(Duration(seconds: timeoutInSeconds));

      return handleResponse(response, uri);
    } catch (e) {
      debugPrint("Error in postMultipartData: $e");
      return dio.Response(
        requestOptions: dio.RequestOptions(path: uri),
        statusCode: 1,
      );
    }
  }

  Future<dio.Response> putData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: ${_dio.options.headers}');
      debugPrint('====> API Body: $body');
      final response = await _dio.put(
        appBaseUrl! + uri,
        data: jsonEncode(body),
        options: Options(headers: headers ?? _dio.options.headers),
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return dio.Response(requestOptions: RequestOptions(path: uri))..statusCode = 1;
    }
  }

  Future<dio.Response> deleteData(String uri, {Map<String, String>? headers, body}) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: ${_dio.options.headers}');
      final response = await _dio.delete(
        appBaseUrl! + uri,
        data: jsonEncode(body),
        options: Options(headers: headers ?? _dio.options.headers),
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return dio.Response(requestOptions: RequestOptions(path: uri))..statusCode = 1;
    }
  }

  dio.Response handleResponse(dio.Response response, String uri) {
    dynamic _body;
    try {
      _body = response.data;
    } catch (e) {
      debugPrint("Error parsing JSON: ${e.toString()}");
    }

    dio.Response _response = dio.Response(
      data: _body ?? response.data,
      headers: response.headers,
      statusCode: response.statusCode,
      requestOptions: response.requestOptions, // ✅ Required parameter
    );

    if (_response.statusCode != 200 && _response.data != null && _response.data is! String) {
      if (_response.data.toString().startsWith('{errors: [{code:')) {
        _response = dio.Response(
          statusCode: _response.statusCode,
          data: _response.data,
          requestOptions: response.requestOptions, // ✅ Required
        );
      } else if (_response.data.toString().startsWith('{message')) {
        _response = dio.Response(
          statusCode: _response.statusCode,
          data: _response.data,
          requestOptions: response.requestOptions, // ✅ Required
        );
      }
    } else if (_response.statusCode != 200 && _response.data == null) { // ✅ Fixed `.body`
      _response = dio.Response(
        data: {},
        statusCode: 0,
        requestOptions: response.requestOptions, // ✅ Required
      );
    }

    return _response;
  }

}

class MultipartBody {
  String key;
  XFile file;

  MultipartBody(this.key, this.file);
}
