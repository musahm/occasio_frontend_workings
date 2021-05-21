import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:occasio_frontend_workings/core/errors/exceptions.dart';
import 'package:occasio_frontend_workings/features/dashboard/data/models/userModel.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart' show rootBundle;

Future<String> getDashboardJson() {
  return rootBundle.loadString('dasboard_response.json');
}

abstract class RemoteDataSource {
  /// calls the endpoint
  Future<List<UserModel>> getMatches(int phoneNumber);
}

final endPoint = 'https://difa.network/recommendations/explore/10';

final headers = {
  'Accept': 'application/json',
  'Content-Type': 'application/json',
  "Authorization": "token 6432ea632dbe62f1bbba6fdd48c8f60cbdef1f72"
};

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({@required this.client});

  @override
  Future<List<UserModel>> getMatches(int matchLevel) async {
    final Uri url = Uri.parse(endPoint);
    print(url);

    List<UserModel> matches = [];
    try {
      final http.Response response = await http.get(url, headers: headers);
      print(response);

      int statusCode = response.statusCode;
      String body = response.body;
      if (statusCode == 200) {
        print('success');
        final List<dynamic> res = json.decode(body);

        res.forEach((element) {
          matches.add(UserModel.fromJson(element));
        });

        print(matches);
        return matches;
      } else {
        print('error');
        throw ServerException();
      }
    } catch (e) {
      print(e);
      matches.add(UserModel.dummyModel());
      return matches;
    }
  }
}
