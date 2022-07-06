import 'package:alternative_code/core/constant/strings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class APIConnection extends GetConnect {
  bool showMessage = true;
  APIConnection() {
    httpClient.baseUrl = AppStrings.basUrl;
    httpClient.followRedirects = true;
    httpClient.defaultContentType = 'application/json';
    httpClient.timeout = const Duration(seconds: 15);
  }

  @override
  Future<Response<T>> get<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) async {
    var r;
    if (await checkConnection()) {
      r = super.get(url,
          headers: headers,
          contentType: contentType,
          query: query,
          decoder: decoder);
      r.then((Response value) {
        if (value.body['success'] == false) {
          showDialog(value.body['errors']);
        }
      }).timeout(const Duration(seconds: 15), onTimeout: () {
        showDialog('connection Error');
      });
      return r;
    } else {
      print("-----------------( error in Connection )------------------");
      showDialog('connection');
      return r;
    }
  }

  ///-------------------check
  Future<bool> checkConnection() async {
    bool connectionStatus = true;
    try {
      await Connectivity().checkConnectivity().then((value) {
        if (value == ConnectivityResult.mobile ||
            value == ConnectivityResult.wifi) {
          connectionStatus = true;
        } else {
          connectionStatus = false;
        }
      });
    } catch (_) {
      connectionStatus = false;
    }
    return connectionStatus;
  }

  void showDialog(dynamic res) {
    if (showMessage) {
      Get.snackbar("error", res.toString());
    }
  }
}
