import 'package:dio/dio.dart';

class NetworkService{
static final NetworkService instance = NetworkService._internal();
  NetworkService._internal();

  final Dio dio = Dio(BaseOptions(
    baseUrl: "https://sandbox.api.lettutor.com/",
    headers: {
      "Content-Type": "application/json",
      // Hard code token
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmNTY5YzIwMi03YmJmLTQ2MjAtYWY3Ny1lY2MxNDE5YTZiMjgiLCJpYXQiOjE3MDA0MDk4MzEsImV4cCI6MTcwMDQ5NjIzMSwidHlwZSI6ImFjY2VzcyJ9.rI5QgaBnYDhxvMPV-tOxaOe9MYCnMvR8ErBCQYP-Ucg",
    },
  ));
}