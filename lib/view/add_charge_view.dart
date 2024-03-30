import 'package:car_rental/helpers/constants/constants.dart';
import 'package:car_rental/view/summery_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/common_controller.dart';
import '../widgets/CustomButton.dart';
import '../widgets/back_button.dart';
import '../widgets/container_widget.dart';
import '../widgets/option_check_box.dart';
import '../widgets/title_widget.dart';

class AdditionalCharges extends StatefulWidget {
  const AdditionalCharges({super.key});

  @override
  State<AdditionalCharges> createState() => _SummeryDetailsState();
}

class _SummeryDetailsState extends State<AdditionalCharges> {
  final CommonController commonController = Get.put(CommonController());

  @override
  void initState() {
    super.initState();
    commonController.onOptionSelected('Collision Damage Waiver', '9.0', "\$");
    commonController.selectedOption.value = 'Collision Damage Waiver';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final CommonController commonController = Get.put(CommonController());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Align(alignment: Alignment.centerLeft, child: CustomBackButton()),
              gapHeight(size: size.height * 0.088),

              ///****************************************** title *****************************************
              const TitleWidget(title: "Additional Charges"),
              const SizedBox(height: 20),

              ///****************************************** additional charges *****************************************
              ContainerWidget(
                  child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OptionCheckbox(
                      option: 'Collision Damage Waiver',
                      price: '9.0',
                      currency: true,
                      selectedOption: commonController.selectedOption.value,
                      onSelect: commonController.onOptionSelected,
                    ),
                    OptionCheckbox(
                      option: 'Liability Insurance',
                      price: '15.0',
                      currency: true,
                      selectedOption: commonController.selectedOption.value,
                      onSelect: commonController.onOptionSelected,
                    ),
                    OptionCheckbox(
                      option: 'Rental Tax',
                      price: '1.5',
                      percentage: true,
                      selectedOption: commonController.selectedOption.value,
                      onSelect: commonController.onOptionSelected,
                    ),
                  ],
                ),
              )),
              gapHeight(size: size.height * 0.4),

              ///****************************************** button *****************************************
              CustomButton(
                text: "Next",
                onTap: () {
                  Get.to(() => const SummeryDetails(), transition: Transition.rightToLeft);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
