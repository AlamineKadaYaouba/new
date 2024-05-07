import 'package:get/get.dart';

import '../capacity_model.dart';

class CapacityProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Capacity.fromJson(map);
      if (map is List)
        return map.map((item) => Capacity.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Capacity?> getCapacity(int id) async {
    final response = await get('capacity/$id');
    return response.body;
  }

  Future<Response<Capacity>> postCapacity(Capacity capacity) async =>
      await post('capacity', capacity);
  Future<Response> deleteCapacity(int id) async => await delete('capacity/$id');
}
