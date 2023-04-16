import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

class MyApi {
  String host = "https://freeticketfreevisa.com/api/";
  get(String path, [String? token]) async {
    final response = await http.get(
      Uri.parse(host + path),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader:
            token == null ? "null" : 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      log(response.reasonPhrase ?? "failed without a reason");
      return [];
    }
  }

  delete(String path) async {
    final response = await http.delete(
      Uri.parse(host + path),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  post(String path, String body) async {
    final response = await http.post(
      Uri.parse(host + path),
      body: body,
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      log(response.reasonPhrase ?? "failed without a reason");
      return response;
    }
  }

  postWithParams(String path, String params) async {
    final response = await http.post(
      Uri.parse("$host$path?$params"),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      log(response.reasonPhrase ?? "failed without a reason");
      return response;
    }
  }

  put(String path, String body) async {
    final response = await http.put(
      Uri.parse(host + path),
      body: body,
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      log(response.reasonPhrase ?? "failed without a reason");
      return response;
    }
  }
}

final MyApi api = MyApi();
