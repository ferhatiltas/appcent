import 'package:dio/dio.dart';
import '../../view/home/model/home_response_model.dart';
import '../constants/enum/network_paths.dart';

abstract class IHomeService {
  final Dio dio;
  IHomeService(this.dio);
  final String curiosityPath = NetworkPaths.CURIOSITY.rawValue;
  final String opportunityPath = NetworkPaths.OPPORTUNITY.rawValue;
  final String spiritPath = NetworkPaths.SPIRIT.rawValue;

  Future<NasaPhotosResponeModel?> fetchNasaPhotos({required String vehiclePath, required Map<String, dynamic> queryParameters});
}
