import 'dart:convert';


import 'package:alternative_code/core/constant/api_connection.dart';
import 'package:get/get.dart';

import '../model/Person_model.dart';

class HomeAPI extends APIConnection{
  Future<List<PersonModel>> getPopularList(int pageNumber) async {
    print(pageNumber);
    Response response=await get('popular?api_key=bc2e1c95566cd043dbc378ad350737ce&language=en-US&page=$pageNumber');
    return response.body['results']
        .map((e) => PersonModel.fromJson(e))
        .toList()
        .cast<PersonModel>();
  }
}
