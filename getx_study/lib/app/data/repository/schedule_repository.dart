import 'dart:convert';

import 'package:getx_study/app/data/model/schedule_model.dart';
import 'package:getx_study/app/data/provider/schedule_provider.dart';

class ScheduleRepository {
  ScheduleApiClient apiClient = ScheduleApiClient();
  Future<List<Schedule>> getAll() async {
    List<Map<String, dynamic>> responseApi = await apiClient.getAll();

    List<Schedule> responseReturn = responseApi.map((element) {
      return Schedule.fromJson(element);
    }).toList();

    return responseReturn;
  }
}
