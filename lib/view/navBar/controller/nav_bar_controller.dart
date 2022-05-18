import 'package:appcent/core/base/controller/base_controller.dart';
import 'package:appcent/view/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/enum/network_paths.dart';

class NavBarController extends BaseController {
  final HomeController homeController = Get.put(HomeController());
  final TextEditingController searchTextController = TextEditingController();

  final _pageIndex = 0.obs;
  int get pageIndex => _pageIndex.value;
  set pageIndex(int index) => _pageIndex.value = index;

  final _isTappedSearch = false.obs;
  bool get isTappedSearch => _isTappedSearch.value;
  set isTappedSearch(bool value) => _isTappedSearch.value = value;

  void buildOnTapNavBarItem(int index) {
    pageIndex = index;
    switch (index) {
      case 0:
        homeController.vehiclePath = NetworkPaths.CURIOSITY.rawValue;
        homeController.pageNumber = 1;
        homeController.onInit();
        break;
      case 1:
        homeController.vehiclePath = NetworkPaths.OPPORTUNITY.rawValue;
        homeController.pageNumber = 1;
        homeController.onInit();
        break;
      case 2:
        homeController.vehiclePath = NetworkPaths.SPIRIT.rawValue;
        homeController.pageNumber = 1;
        homeController.onInit();
        break;
      default:
        homeController.vehiclePath = '';
        homeController.pageNumber = 1;
        homeController.onInit();
    }
  }

  void clearTexFieldAndUpdateList() {
    searchTextController.clear();
    homeController.nasaPhotosFiltered = homeController.photos ?? [];
    isTappedSearch = false;
  }

  void filteredPhotoList(String value) {
    if (homeController.photos != null) {
      homeController.nasaPhotosFiltered = homeController.photos!
          .where(
            (photo) =>
                photo.camera!.name!.contains(value) ||
                photo.camera!.name!.toLowerCase().contains(value) ||
                photo.camera!.fullName!.contains(value) ||
                photo.camera!.fullName!.toLowerCase().contains(value),
          )
          .toList();
    }
  }
}
