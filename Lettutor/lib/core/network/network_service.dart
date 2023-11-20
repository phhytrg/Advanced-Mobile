import 'package:dio/dio.dart';

class NetworkService{
static final NetworkService instance = NetworkService._internal();
  NetworkService._internal();

  final Dio dio = Dio(BaseOptions(
    baseUrl: "https://sandbox.api.lettutor.com/",
    headers: {
      "Content-Type": "application/json",
      // Hard code token
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmNTY5YzIwMi03YmJmLTQ2MjAtYWY3Ny1lY2MxNDE5YTZiMjgiLCJpYXQiOjE3MDA0OTY2MDMsImV4cCI6MTcwMDU4MzAwMywidHlwZSI6ImFjY2VzcyJ9.ee0K6wagGI_7--HtScoWu-wi3L5NFFwFqWFxBIs2rNk",
    },
  ));
}