import 'package:dio/dio.dart';

import 'package:etanois/core/custom_dio/custom_interceptors.dart';

import 'package:etanois/core/utils/constants.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    client.options.baseUrl = API_URL_BASE;
    client.options.connectTimeout = 25000;

    client.interceptors.add(CustomInterceptors());
  }
}
