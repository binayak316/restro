import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_management_sys/core/model/item_model.dart';
import 'package:restro_management_sys/core/repo/category_repo.dart';
import 'package:restro_management_sys/core/utils/constants/enums.dart';
import 'package:restro_management_sys/core/utils/helpers/log_helper.dart';

class SearchProductController extends GetxController {
  RxList<CafeItem> searchList = RxList();
  Rx<PageState> pageState = PageState.LOADING.obs;

  final searchController = TextEditingController();

  void onTextChange(String value) {
    EasyDebounce.debounce("Search-Product", const Duration(milliseconds: 500),
        () {
      searchItems();
    });
  }

  void searchItems() async {
    searchList.clear();
    Categoryrepo.searchProducts(
      keyword: searchController.text,
      onSuccess: (events) {
        if (events.isEmpty) {
          pageState.value = PageState.EMPTY;
        } else {
          searchList.addAll(events);
          pageState.value = PageState.NORMAL;
        }
      },
      onError: (message) {
        pageState.value = PageState.ERROR;
        LogHelper.error(message);
      },
    );
  }
}
