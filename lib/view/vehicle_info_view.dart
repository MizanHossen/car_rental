import 'dart:ffi';

import 'package:car_rental/controller/vichicle_info_controller.dart';
import 'package:car_rental/helpers/api_helper/api_status_handler.dart';
import 'package:car_rental/helpers/constants/constants.dart';
import 'package:car_rental/helpers/constants/validation_class.dart';
import 'package:car_rental/models/car_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/common_controller.dart';
import '../widgets/CustomButton.dart';
import '../widgets/back_button.dart';
import '../widgets/container_widget.dart';
import '../widgets/drop_down_input_field.dart';
import '../widgets/simple_input_field.dart';
import '../widgets/title_widget.dart';
import 'add_charge_view.dart';

class VehicleInfoView extends StatelessWidget {
  const VehicleInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final CommonController commonController = Get.put(CommonController());
    final VehicleInfoController vehicleInfoController = Get.put(VehicleInfoController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20).copyWith(top: MediaQuery.paddingOf(context).top + 20),
        child: Obx(() => vehicleInfoController.apiStatusHandler.value.screenReady && !vehicleInfoController.apiStatusHandler.value.hasError
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    const Align(alignment: Alignment.centerLeft, child: CustomBackButton()),
                    gapHeight(size: size.height * 0.088),

                    ///************************************************** title ******************************************
                    const TitleWidget(title: "Vehicle Information"),
                    const SizedBox(height: 20),

                    ///************************************************** vehicle info ******************************************
                    ContainerWidget(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            ///*************************** Vehicle Type *************************
                            DropDownInputField(
                              controller: commonController.vehicleTypeController,
                              hintText: "",
                              needValidation: true,
                              needTitle: true,
                              backgroundColor: Colors.white,
                              errorMessage: "",
                              fieldTitle: "Vehicle Type",
                              setInitialValue: false,
                              items: vehicleInfoController.carList?.toSet().toList(),
                              onValueChange: () {
                                commonController.vehicleModelController.text =
                                    vehicleInfoController.getModel(selectedType: commonController.vehicleTypeController.text);
                                vehicleInfoController.selectedCarModel.value =
                                    vehicleInfoController.getFullModel(selectedType: commonController.vehicleTypeController.text);
                              },
                            ),
                            gapHeight(size: 10),

                            ///*************************** Vehicle Model *************************
                            SimpleInputField(
                              controller: commonController.vehicleModelController,
                              hintText: "",
                              needValidation: true,
                              viewOnly: true,
                              errorMessage: "",
                              validatorClass: ValidatorClass().validateEmptyField,
                              fieldTitle: "Vehicle Model",
                            ),
                          ],
                        ),
                      ),
                    ),
                    gapHeight(size: 20),

                    ///*********************************************** Car Info *******************************************

                    if (vehicleInfoController.selectedCarModel.value.imageUrl != null)
                      ContainerWidget(
                        padding: EdgeInsets.zero,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                children: [
                                  Expanded(child: Image.network(vehicleInfoController.selectedCarModel.value.imageUrl.toString())),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(vehicleInfoController.selectedCarModel.value.model.toString(),
                                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                                        const SizedBox(height: 8),
                                        Row(children: [const Icon(Icons.person), Text("${vehicleInfoController.selectedCarModel.value.seats} seats")]),
                                        Row(
                                          children: [const Icon(Icons.shopping_bag), Text("${vehicleInfoController.selectedCarModel.value.bags} bags")],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(color: kPrimaryColor),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("\$${vehicleInfoController.selectedCarModel.value.rates!.hourly} / Hour"),
                                  Text("\$${vehicleInfoController.selectedCarModel.value.rates!.daily} / Day"),
                                  Text("\$${vehicleInfoController.selectedCarModel.value.rates!.weekly} /Week"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    gapHeight(size: size.height * 0.25),

                    ///****************************************** button *****************************************
                    CustomButton(
                        text: "Next",
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Get.to(() => const AdditionalCharges(), transition: Transition.rightToLeft);
                          }
                        }),
                  ],
                ),
              )
            : vehicleInfoController.apiStatusHandler.value.hasError
                ? const Center(child: Text("Please try again"))
                : const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
