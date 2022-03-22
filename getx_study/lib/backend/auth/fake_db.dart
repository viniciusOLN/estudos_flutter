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
}
