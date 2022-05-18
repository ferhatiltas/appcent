import 'dart:io';

import 'package:appcent/core/service/IHomeService.dart';
import 'package:appcent/view/home/model/home_response_model.dart';
import 'package:dio/dio.dart';

class NasaPhotosService extends IHomeService {
  NasaPhotosService(Dio dio) : super(dio);

  @override
  Future<NasaPhotosResponeModel?> fetchNasaPhotos({required String vehiclePath, required Map<String, dynamic> queryParameters}) async {
    final response = await dio.get(vehiclePath, queryParameters: queryParameters);

    if (response.statusCode == HttpStatus.ok) {
      return NasaPhotosResponeModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
