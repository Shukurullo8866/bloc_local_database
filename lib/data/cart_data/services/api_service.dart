import 'package:dio/dio.dart';
import '../model/card_model.dart';
import '../model/my_response.dart';
import 'api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getAllCards() async {
    MyResponse myResponse=MyResponse(error: "");
    try {
      print("Keldi");
      Response response =
      await dio.get("${dio.options.baseUrl}/user_cards");
      if (response.statusCode == 200) {
        myResponse.data = response.data.map((e) => CardModel.fromJson(e)).toList();
        print("Respons zzz");
      }
    } catch (e) {
      myResponse.error = e.toString();
      print(e.toString());
    }
    return myResponse;
  }
}