class FakeData {
  static List<Map<String, dynamic>> responseApiLoginUser = [
    {
      "user": {
        "id": 1,
        "username": "admin",
        "password": "admin",
        "activated": true,
      },
      "access_token": "key12344A",
      "token_type": "bearer",
      "expires_in": 3600,
    },
    {
      "user": {
        "id": 2,
        "username": "vinicius",
        "password": "vinicius123",
        "activated": true,
      },
      "access_token": "key12345A",
      "token_type": "bearer",
      "expires_in": 3600,
    },
  ];

  static List<Map<String, dynamic>> responseSchedules = [
    {
      "id": 1,
      "scheduling_date": "2001-1109T3:4",
      "user_id": 1,
      "employee_id": 1,
      "service_id": 1,
      "employee": {
        "id": 1,
        "first_name": "José",
        "company_id": 1,
        "user_id": 1
      },
      "service": {
        "id": 1,
        "name": "corte de cabelo",
        "cost": 25,
        "employee_id": 1
      },
    },
    {
      "id": 1,
      "scheduling_date": "2001-1109T3:4",
      "user_id": 1,
      "employee_id": 1,
      "service_id": 1,
      "employee": {
        "id": 1,
        "first_name": "José",
        "company_id": 1,
        "user_id": 1
      },
      "service": {
        "id": 1,
        "name": "corte de cabelo",
        "cost": 25,
        "employee_id": 1
      },
    },
  ];
}
