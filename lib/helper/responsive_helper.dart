
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';

class Responsive {
  static bool isMobilePhone() {
    if (!kIsWeb) {
      return true;
    } else {
      return false;
    }
  }

  static bool isWeb() {
    return kIsWeb;
  }

  static bool isSmallMobile() {
    final size = Get.width;
    return size < 375;
  }

  static bool isMobile(context) {
    final size = MediaQuery.of(context).size.width;
    if (size < 650 || !kIsWeb) {
      return true;
    } else {
      return false;
    }
  }

  static bool isTab() {
    final size = Get.width;
    if (size < 1300 && size >= 650) {
      return true;
    } else {
      return false;
    }
  }

  static bool isDesktop<T>() {
    Get.context!.responsiveValue<T>();
    final size = Get.width;
    if (size >= 1300) {
      return true;
    } else {
      return false;
    }
  }
}
