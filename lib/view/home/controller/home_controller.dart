import 'package:appcent/core/base/controller/base_controller.dart';
import 'package:appcent/core/constants/app/app_constants.dart';
import 'package:appcent/core/constants/enum/network_paths.dart';
import 'package:appcent/core/service/IHomeService.dart';
import 'package:appcent/core/service/nasa_photos_service.dart';
import 'package:appcent/view/home/model/home_request_model.dart';
import 'package:appcent/view/home/model/home_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeController extends BaseController {
  late final IHomeService service;
  ScrollController homeViewScrollController = ScrollController();

  final _vehiclePath = ''.obs;
  String get vehiclePath => _vehiclePath.value;
  set vehiclePath(String path) => _vehiclePath.value = path;

  final _isLoadPhotos = false.obs;
  bool get isLoadPhotos => _isLoadPhotos.value;
  set isLoadPhotos(bool isLoad) => _isLoadPhotos.value = isLoad;

  final _isAddingPage = false.obs;
  bool get isAddingPage => _isAddingPage.value;
  set isAddingPage(bool value) => _isAddingPage.value = value;

  final _nasaPhotosFiltered = [].obs;
  List get nasaPhotosFiltered => _nasaPhotosFiltered;
  set nasaPhotosFiltered(List list) => _nasaPhotosFiltered.value = list;
  void nasaPhotosFilteredAddAll(List list) {
    _nasaPhotosFiltered.addAll(list);
  }

  List<Photos>? photos = [];
  int pageNumber = 1;

  @override
  void onInit() {
    if (vehiclePath == '') {
      service = NasaPhotosService(Dio(BaseOptions(baseUrl: ApplicationConstants.BASE_URL)));
    }
    getNasaPhotos(isFirstLoad: true);
    _buildAddListener;
    super.onInit();
  }

  Future<void> getNasaPhotos({required bool isFirstLoad}) async {
    if (isFirstLoad) {
      isLoadPhotos = true;
    }
    final data = await service.fetchNasaPhotos(
        vehiclePath: vehiclePath == '' ? NetworkPaths.ROVERS.rawValue + NetworkPaths.CURIOSITY.rawValue : NetworkPaths.ROVERS.rawValue + vehiclePath,
        queryParameters: HomeRequestModel(
          sol: 1000,
          apiKey: ApplicationConstants.API_KEY,
          page: pageNumber,
        ).toJson());

    if (data is NasaPhotosResponeModel) {
      if (pageNumber == 1) {
        photos = data.photos;
        nasaPhotosFiltered = photos ?? [];
      } else {
        photos?.addAll(data.photos ?? []);
        nasaPhotosFilteredAddAll(data.photos ?? []);
      }
    } else {
      print('null data');
    }
    if (isFirstLoad) {
      isLoadPhotos = false;
    }
  }

  void get _buildAddListener {
    homeViewScrollController.addListener(
      () async {
        if (homeViewScrollController.position.extentAfter < 50.h) {
          isAddingPage = true;
          if (homeViewScrollController.position.pixels == homeViewScrollController.position.maxScrollExtent) {
            pageNumber++;
            await getNasaPhotos(isFirstLoad: false);
            isAddingPage = false;
          }
        }
      },
    );
  }
}
