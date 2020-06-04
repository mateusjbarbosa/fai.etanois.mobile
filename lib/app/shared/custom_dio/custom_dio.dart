import 'package:dio/dio.dart';

import 'package:etanois/app/shared/custom_dio/custom_interceptors.dart';

import 'package:etanois/app/shared/utils/constans.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    client.options.baseUrl = API_URL_BASE;
    client.options.connectTimeout = 10000;

    client.interceptors.add(CustomInterceptors());
  }
}
