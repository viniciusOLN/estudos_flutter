import 'package:getx_study/backend/schedule/schedule.dart';

class ScheduleApiClient {
  Future<List<Map<String, dynamic>>> getAll() async {
    ScheduleAPI responseAPI = ScheduleAPI();
    try {
      return await responseAPI.getAllSchedules();
    } catch (e) {
      rethrow;
    }
  }
}
