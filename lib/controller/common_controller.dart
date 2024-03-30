import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonController extends GetxController {
  @override
  void onInit() {
    calculateDuration();
    super.onInit();
  }

  final reservationIdController = TextEditingController();
  final discountController = TextEditingController();
  final startDateController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final vehicleTypeController = TextEditingController();
  final vehicleModelController = TextEditingController();
  var pickupDate = DateTime.now().obs;
  var returnDate = DateTime.now().add(const Duration(days: 1)).obs;
  var duration = ''.obs;
  var selectedOption = ''.obs;
  var selectedPrice = ''.obs;
  var selectedCurrency = ''.obs;

  Future<void> selectDate(BuildContext context, bool isPickupDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      if (isPickupDate) {
        pickupDate.value = picked;
      } else {
        returnDate.value = picked;
      }
      if (pickupDate != null && returnDate != null) {
        calculateDuration();
      }
    }
  }

  void calculateDuration() {
    final difference = returnDate.value.difference(pickupDate.value).inDays;
    duration.value = '$difference';
  }

  void onOptionSelected(String option, String price, String currency) {
      selectedOption.value = option;
      selectedPrice.value = price;
      selectedCurrency.value = currency;

      print(selectedCurrency.value+ selectedOption.value + selectedPrice.value);

  }
}
