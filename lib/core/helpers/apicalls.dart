// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../errors/errors.dart';
import '../utils/debugprint.dart';
import 'package:http/http.dart' as http;

const int _timeout = 15;

abstract class ApiCalls {
  static Future<Map<String, dynamic>> getProtected({
    required String apiUrl,
    required String token,
    String? querryParams,
    Exception? errorExption,
  }) async {
    final parseUri = "$apiUrl?$querryParams";
    print('''
  token: $token
  request : GET
  uri:  $parseUri ''');
    try {
      final response = await http.get(
        Uri.parse(parseUri),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      ).timeout(const Duration(seconds: _timeout));
      DebPrint.log(response.statusCode);
      if (response.statusCode != 200) {
        final Map<String, dynamic> errorData = json.decode(response.body);
        DebPrint.log(errorData);
        throw errorExption ?? ErrorApiException(errorData.toString());
      }
      final Map<String, dynamic> data = json.decode(response.body);
      DebPrint.log(data.toString());
      return (data);
    } on TimeoutException catch (_) {
      throw TimeoutApiException();
    } on SocketException catch (_) {
      throw SocketApiException();
    } on Error catch (e) {
      throw ErrorApiException(e.toString());
    }
  }

  static Future<Map<String, dynamic>> get({
    required String apiUrl,
    String? querryParams,
    Exception? errorExption,
  }) async {
    final parseUri = "$apiUrl?$querryParams";
    print('''
  request : GET
  uri:  $parseUri ''');
    try {
      final response = await http.get(
        Uri.parse(parseUri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      ).timeout(const Duration(seconds: _timeout));
      DebPrint.log(response.statusCode);
      if (response.statusCode != 200) {
        final Map<String, dynamic> errorData = json.decode(response.body);
        throw errorExption ?? ErrorApiException(errorData.toString());
      }
      final Map<String, dynamic> data = json.decode(response.body);
      DebPrint.log(data.toString());
      return (data);
    } on TimeoutException catch (_) {
      throw TimeoutApiException();
    } on SocketException catch (_) {
      throw SocketApiException();
    } on Error catch (e) {
      throw ErrorApiException(e.toString());
    }
  }

  static Future<Map<String, dynamic>> postProtected({
    required String apiUrl,
    required String token,
    required Map<String, dynamic> bodyData,
    String? querryParams,
    Exception? errorExption,
  }) async {
    final parseUri = apiUrl;
    DebPrint.log('''
  token: $token
  request : POST
  body: ${bodyData.toString()}
  uri:  $parseUri
  query: ${querryParams ?? ''} ''');
    try {
      final response = await http
          .post(
            Uri.parse(parseUri),
            headers: {
              HttpHeaders.authorizationHeader: "Bearer $token",
              HttpHeaders.contentTypeHeader: "application/json",
            },
            body: json.encode(bodyData),
          )
          .timeout(const Duration(seconds: _timeout));
      DebPrint.log(response.statusCode);
      DebPrint.log(response.body.toString());
      if (response.statusCode == 401 ||
          response.statusCode == 400 ||
          (response.statusCode != 201 && response.statusCode != 200)) {
        final Map<String, dynamic> errorData = json.decode(response.body);
        throw errorExption ?? ErrorApiException(errorData.toString());
      }

      final Map<String, dynamic> data = json.decode(response.body);
      DebPrint.log(data.toString());
      return (data);
    } on TimeoutException catch (_) {
      throw TimeoutApiException();
    } on SocketException catch (_) {
      throw SocketApiException();
    } on Error catch (e) {
      throw ErrorApiException(e.toString());
    }
  }

  static Future<Map<String, dynamic>> post({
    required String apiUrl,
    required Map<String, dynamic> bodyData,
    String? querryParams,
    Exception? errorExption,
  }) async {
    final parseUri = apiUrl;
    DebPrint.log('''
  request : POST
  uri:  $parseUri
  body: ${bodyData.toString()}
  query: ${querryParams ?? ''} ''');
    try {
      final response = await http
          .post(
            Uri.parse(parseUri),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            },
            body: json.encode(bodyData),
          )
          .timeout(const Duration(seconds: _timeout));
      DebPrint.log(response.statusCode);
      DebPrint.log(response.body.toString());
      if (response.statusCode == 401 ||
          response.statusCode == 400 ||
          (response.statusCode != 201 && response.statusCode != 200)) {
        final Map<String, dynamic> errorData = json.decode(response.body);
        throw errorExption ?? ErrorApiException(errorData.toString());
      }
      final Map<String, dynamic> data = json.decode(response.body);
      DebPrint.log(data.toString());
      return (data);
    } on TimeoutException catch (_) {
      throw TimeoutApiException();
    } on SocketException catch (_) {
      throw SocketApiException();
    } on Error catch (e) {
      throw ErrorApiException(e.toString());
    }
  }

  static Future<Map<String, dynamic>> putProtected({
    required String apiUrl,
    required String token,
    required Map<String, dynamic> bodyData,
    Exception? errorExption,
  }) async {
    final parseUri = apiUrl;
    DebPrint.log('''
  token: $token
  request : PUT
  body: ${bodyData.toString()}
  uri:  $parseUri ''');
    try {
      final response = await http
          .put(
            Uri.parse(parseUri),
            headers: {
              HttpHeaders.authorizationHeader: "Bearer $token",
              HttpHeaders.contentTypeHeader: "application/json",
            },
            body: json.encode(bodyData),
          )
          .timeout(const Duration(seconds: _timeout));
      DebPrint.log(response.statusCode);
      DebPrint.log(response.body.toString());
      if (response.statusCode == 401 ||
          response.statusCode == 400 ||
          response.statusCode != 200) {
        final Map<String, dynamic> errorData = json.decode(response.body);
        throw errorExption ?? ErrorApiException(errorData.toString());
      }
      final Map<String, dynamic> data = json.decode(response.body);
      DebPrint.log(data.toString());
      return (data);
    } on TimeoutException catch (_) {
      throw TimeoutApiException();
    } on SocketException catch (_) {
      throw SocketApiException();
    } on Error catch (e) {
      throw ErrorApiException(e.toString());
    }
  }

  static Future<Map<String, dynamic>> deleteProtected({
    required String apiUrl,
    required String token,
    Exception? errorExption,
  }) async {
    final parseUri = apiUrl;
    DebPrint.log('''
  token: $token
  request : DELETE
  uri:  $parseUri ''');
    try {
      final response = await http.delete(
        Uri.parse(parseUri),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
      ).timeout(const Duration(seconds: _timeout));
      DebPrint.log(response.statusCode);
      DebPrint.log(response.body.toString());
      if (response.statusCode == 401 ||
          response.statusCode == 400 ||
          response.statusCode != 200) {
        final Map<String, dynamic> errorData = json.decode(response.body);
        throw errorExption ?? ErrorApiException(errorData.toString());
      }
      final Map<String, dynamic> data = json.decode(response.body);
      DebPrint.log(data.toString());
      return (data);
    } on TimeoutException catch (_) {
      throw TimeoutApiException();
    } on SocketException catch (_) {
      throw SocketApiException();
    } on Error catch (e) {
      throw ErrorApiException(e.toString());
    }
  }
}
