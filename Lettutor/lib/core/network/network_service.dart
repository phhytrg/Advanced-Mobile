import 'package:dio/dio.dart';

class NetworkService{
static final NetworkService instance = NetworkService._internal();
  NetworkService._internal();

  final Dio dio = Dio(BaseOptions(
    baseUrl: "https://sandbox.api.lettutor.com/",
    headers: {
      "Content-Type": "application/json",
      // Hard code token
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmNTY5YzIwMi03YmJmLTQ2MjAtYWY3Ny1lY2MxNDE5YTZiMjgiLCJpYXQiOjE3MDEyNzM3ODYsImV4cCI6MTcwMTM2MDE4NiwidHlwZSI6ImFjY2VzcyJ9.4yx_aeeI8TDysrq6fNraV3we7thq6D5nA6O6aGjAvOA",
    },
  ));
}