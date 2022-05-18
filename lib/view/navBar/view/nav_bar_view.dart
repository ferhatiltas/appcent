import 'package:appcent/core/base/view/base_view.dart';
import 'package:appcent/view/home/view/home_view.dart';
import 'package:appcent/view/navBar/controller/nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NavBarView extends BaseView<NavBarController> {
  const NavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: const HomeView(),
        appBar: _buildAppBar(context),
        bottomNavigationBar: Obx(
          () => Theme(
            data: Theme.of(context).copyWith(canvasColor: context.theme.selectedRowColor),
            child: BottomNavigationBar(
              currentIndex: controller.pageIndex,
              onTap: (index) {
                controller.buildOnTapNavBarItem(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.air),
                  label: 'Curiosity',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.workspaces_outline),
                  label: 'Opportunity',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.wifi_protected_setup_outlined),
                  label: 'Spirit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.primaryColor,
      centerTitle: true,
      toolbarHeight: 7.h,
      actions: controller.isTappedSearch
          ? null
          : [
              IconButton(
                  onPressed: () {
                    controller.isTappedSearch = true;
                  },
                  icon: const Icon(Icons.search))
            ],
      title: controller.isTappedSearch
          ? _buildSearchBar()
          : Text(
              'Appcent',
              style: TextStyle(
                color: context.theme.selectedRowColor,
                fontSize: 18.sp,
              ),
            ),
    );
  }

  SizedBox _buildSearchBar() {
    return SizedBox(
            width: 100.w,
            height: 5.h,
            child: Center(
              child: TextFormField(
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                autofocus: true,
                keyboardType: TextInputType.text,
                cursorColor: Colors.black,
                controller: controller.searchTextController,
                onChanged: (value) {
                  controller.filteredPhotoList(value);
                },
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black, fontSize: 12.sp),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.clearTexFieldAndUpdateList();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15.5),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
            ),
          );
  }
}
