import 'dart:convert';
import 'package:car_rental/helpers/api_helper/api_urls.dart';
import 'package:car_rental/models/car_list_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../helpers/api_helper/api_status_handler.dart';

class VehicleInfoController extends GetxController {
  var apiStatusHandler = APIStatusHandler().obs;
  CarListModel carListModel = CarListModel();
  var selectedCarModel = CarDate().obs;
  var carList = <String>[].obs;

  @override
  void onInit() {
    carInfoData().then((value) {
      apiStatusHandler.value = value;
      update();
    });
    super.onInit();
  }

  Future<APIStatusHandler> carInfoData() async {
    APIStatusHandler apiStatusHandler = APIStatusHandler();

    Dio dio = Dio(BaseOptions(
      baseUrl: ApiUrl.baseUrl,
    ));

    try {
      final response = await dio.get(ApiUrl.carListUrl);

      if (response.statusCode == 200) {
        apiStatusHandler.screenReady = true;
        carListModel = CarListModel.fromMap(jsonDecode(jsonEncode(response.data)));
        carList.value = carListModel.data!.map((e) => e.type.toString()).toList();

        // print("HTTP Method : ${response.requestOptions.method}");
        // print("HTTP Url : ${response.requestOptions.baseUrl}");
        // print("HTTP Path : ${response.requestOptions.path}");
        // print("HTTP Status Code : ${response.statusCode}");
        // print("HTTP Status msgggg : ${response.statusMessage}");
      } else {
        apiStatusHandler.screenReady = true;
        apiStatusHandler.hasError = true;
      }
    } catch (e) {
      apiStatusHandler.screenReady = true;
      apiStatusHandler.hasError = true;
    }
    return apiStatusHandler;
  }

  String getModel({required String selectedType}) {
    return carListModel.data!.firstWhere((element) => element.type.toString().compareTo(selectedType) == 0).model.toString();
  }

  CarDate getFullModel({required String selectedType}) {
    return carListModel.data!.firstWhere((element) => element.type.toString().compareTo(selectedType) == 0);
  }
}
