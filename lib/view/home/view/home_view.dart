import 'package:appcent/core/base/view/base_view.dart';
import 'package:appcent/view/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoadPhotos ? _buildProgressIndicator() : _buildListViewPhotos(),
      ),
    );
  }

  ListView _buildListViewPhotos() {
    return ListView(
      controller: controller.homeViewScrollController,
      children: [
        Obx(
          () => controller.nasaPhotosFiltered.isEmpty
              ? const Center(
                  child: Text('No photos to show!!!'),
                )
              : Padding(
                  padding: EdgeInsets.all(1.h),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.nasaPhotosFiltered.length,
                    physics: const ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 1.h,
                      mainAxisSpacing: 1.h,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: AlertDialog(
                                    backgroundColor: Colors.white,
                                    insetPadding: EdgeInsets.zero,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(32)),
                                    ),
                                    contentPadding: EdgeInsets.all(
                                      1.h,
                                    ),
                                    title: Center(child: Text(controller.nasaPhotosFiltered[index].camera.name)),
                                    content: SizedBox(
                                      height: 50.h,
                                      child: Column(
                                        children: [
                                          Text(controller.nasaPhotosFiltered[index].camera.fullName),
                                          Container(
                                            height: 30.h,
                                            padding: EdgeInsets.only(left: 5.h, right: 5.h, bottom: 5.h, top: 2.h),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(2.h),
                                              child: _buildNetworkImage(index),
                                            ),
                                          ),
                                          Text('Earth Date : ' + controller.nasaPhotosFiltered[index].earthDate.toString()),
                                          Text('Rover Name : ' + controller.nasaPhotosFiltered[index].rover.name.toString()),
                                          Text('Landing Date : ' + controller.nasaPhotosFiltered[index].rover.landingDate.toString()),
                                          Text('Launch Date : ' + controller.nasaPhotosFiltered[index].rover.launchDate.toString()),
                                          Text('Status : ' + controller.nasaPhotosFiltered[index].rover.status.toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2.h),
                          child: Center(
                              child: Stack(
                            children: [
                              _buildNetworkImage(index),
                              Positioned(
                                child: SizedBox(
                                  height: 4.h,
                                  child: Center(
                                      child: Text(
                                    controller.nasaPhotosFiltered[index].camera.name,
                                    style: TextStyle(color: context.theme.selectedRowColor, fontWeight: FontWeight.bold),
                                  )),
                                ),
                              )
                            ],
                          )),
                        ),
                      );
                    },
                  ),
                ),
        ),
        loadingIndicator,
      ],
    );
  }

  Image _buildNetworkImage(int index) {
    return Image.network(
      controller.nasaPhotosFiltered[index].imgSrc,
      fit: BoxFit.cover,
      width: 100.w,
      height: 100.h,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return _buildProgressIndicator();
      },
      errorBuilder: (context, object, stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }

  Widget get loadingIndicator => Obx(() => controller.isAddingPage ? const Center(child: CircularProgressIndicator()) : const SizedBox.shrink());

  Center _buildProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
