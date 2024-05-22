import 'package:get/get.dart';

import '../daily_task_model.dart';

class DaProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return DailyTask.fromJson(map);
      if (map is List) {
        return map.map((item) => DailyTask.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<DailyTask?> getDa(int id) async {
    final response = await get('da/$id');
    return response.body;
  }

  Future<Response<DailyTask>> postDa(DailyTask da) async =>
      await post('da', da);
  Future<Response> deleteDa(int id) async => await delete('da/$id');
}
