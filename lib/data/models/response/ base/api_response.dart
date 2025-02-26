import 'package:get/get_connect/http/src/response/response.dart';

class ApiResponse {
  final Response? response;
  final dynamic error;
  ApiResponse(this.response, this.error);
  ApiResponse.withError(dynamic errorValue): response = null, error = errorValue;
  ApiResponse.withSuccess(Response responseValue): response = responseValue, error = null;
}

// generate json serializable
class ResponseModel<T> {
  final int status;
  final String statusCode;
  final String message;
  final T? data;

  ResponseModel({
    required this.status,
    required this.statusCode,
    required this.message,
    this.data,
  });

  // From JSON constructor
  factory ResponseModel.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return ResponseModel<T>(
      status: json['status'],
      statusCode: json['status_code'],
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}

class PaginationData<T> {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;
  final List<T> lists;

  PaginationData({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    required this.lists,
  });

  factory PaginationData.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return PaginationData<T>(
      currentPage: json['current_page'] as int,
      lastPage: json['last_page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
      lists: (json['lists'] as List<dynamic>)
          .map((e) => fromJsonT(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) {
    return {
      'current_page': currentPage,
      'last_page': lastPage,
      'per_page': perPage,
      'total': total,
      'lists': lists.map((e) => toJsonT(e)).toList(),
    };
  }
}

class ResponseList<T> {
  final List<T>? list;
  final Pages? pages;
  ResponseList({this.list, this.pages});

  ResponseList.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJson) :
    list = json['data'] != null ? List<T>.from(json['data'].map((dynamic item) => fromJson(item))) : null,
    pages = json['pages'] != null ? Pages.fromJson(json['pages']) : null;
}

class Pages {
  int? total;
  int? limit;
  int? page;

  Pages({this.total, this.limit, this.page});

  Pages.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    limit = json['limit'];
    page = json['page'];
  }
}