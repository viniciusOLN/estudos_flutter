import '../fake_db.dart';

class ScheduleAPI {
  List<Map<String, dynamic>> getAllSchedules() {
    return FakeData.responseSchedules;
  }
}
