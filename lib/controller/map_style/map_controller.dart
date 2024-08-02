import 'package:get/get.dart';

class MapStyle extends GetxController {
  String mapStyle =
      'https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png';
  String dark =
      'https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png';
  String white =
      'https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png';
  String satelite =
      'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}';

  RxBool isLoading = false.obs;

  Future<void> refreshStyle() async {
    await Future.delayed(const Duration(seconds: 1));

    mapStyle =
        'https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png';
    update();
  }

  void changeStyle(String color) {
    isLoading.value = true;
    update();

    if (color == 'dark') {
      mapStyle = dark;
      update();
    } else if (color == 'white') {
      mapStyle = white;
      update();
    } else if (color == 'satelite') {
      mapStyle = satelite;
      update();
    }
    Future.delayed(const Duration(milliseconds: 100), () {
      update();
      isLoading.value = false;
    });
  }
}
