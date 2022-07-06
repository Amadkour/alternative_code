import 'dart:convert';
import 'package:alternative_code/core/constant/api_connection.dart';
import 'package:get/get.dart';

import '../model/details_model.dart';

class ProfileAPI extends APIConnection{
  Future<List<DetailsModel>> getPopularList(String id) async {
    Response response=await get('$id/images?api_key=bc2e1c95566cd043dbc378ad350737ce');
    return response.body['profiles']
        .map((e) => DetailsModel.fromJson(e))
        .toList()
        .cast<DetailsModel>();
  }
}
