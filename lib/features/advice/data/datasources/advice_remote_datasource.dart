import 'dart:convert';

import 'package:advice/core/entities/exceptions.dart';
import 'package:http/http.dart' as http;

import '../models/advice_model.dart';

///
abstract class AdviceRemoteDataSource {
  /// request random advice from api
  /// return [AdviceModel] if successfull
  /// throw a server-exception if status code is not 200
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataSourceImpl extends AdviceRemoteDataSource {
  final http.Client client;

  AdviceRemoteDataSourceImpl(this.client);

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final responce = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {
        'content-type': 'application/json',
      },
    );

    if (responce.statusCode != 200) throw ServerException();

    final map = json.decode(responce.body);
    return AdviceModel.fromJson(map);
  }
}


// 