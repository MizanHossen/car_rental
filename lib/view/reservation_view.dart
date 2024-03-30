import 'package:car_rental/controller/common_controller.dart';
import 'package:car_rental/helpers/constants/constants.dart';
import 'package:car_rental/helpers/constants/validation_class.dart';
import 'package:car_rental/widgets/CustomButton.dart';
import 'package:car_rental/widgets/date_picker_field.dart';
import 'package:car_rental/widgets/simple_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../widgets/container_widget.dart';
import '../widgets/title_widget.dart';
import 'customer_info_view.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final CommonController commonController = Get.put(CommonController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            gapHeight(size: size.height * 0.1),

            ///************************************************** title ******************************************
            const TitleWidget(title: "Reservation Details"),
            gapHeight(size: size.height * 0.02),

            ///************************************************** reservation details ******************************
            ContainerWidget(
              child: Obx(() =>
                  Form(
                    key: formKey,
                    child: Column(
                      children: [

                        ///*************************** reservation id *************************
                        SimpleInputField(
                          controller: commonController.reservationIdController,
                          hintText: "",
                          needValidation: true,
                          validatorClass: ValidatorClass().validateId,
                          errorMessage: "",
                          fieldTitle: "Reservation ID",
                          inputType: TextInputType.number,
                        ),
                        const SizedBox(height: 10),

                        ///*************************** pick date *************************
                        DatePickerField(
                          title: 'Pickup Date:',
                          date: ' ${commonController.pickupDate != null ? DateFormat('yyyy-MM-dd').format(commonController.pickupDate.value) : 'Not selected'}',
                          onPickDate: () => commonController.selectDate(context, true),
                        ),
                        const SizedBox(height: 10),

                        ///*************************** return date *************************
                        DatePickerField(
                          title: 'Return Date: ',
                          date: commonController.returnDate != null ? DateFormat('yyyy-MM-dd').format(commonController.returnDate.value) : 'Not selected',
                          onPickDate: () => commonController.selectDate(context, false),
                        ),
                        const SizedBox(height: 20),

                        ///*************************** duration *************************
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Duration", style: TextStyle(fontSize: 17)),
                            ContainerWidget(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), child: Text(commonController.duration.value + " days"))
                          ],
                        ),
                        const SizedBox(height: 20),

                        ///*************************** discount *************************
                        SimpleInputField(
                          controller: commonController.discountController,
                          hintText: "",
                          needValidation: false,
                          errorMessage: "",
                          fieldTitle: "Discount",
                          inputType: TextInputType.number,
                          // validatorClass: ValidatorClass().validateEmptyField,
                        ),
                      ],
                    ),
                  )),
            ),
            gapHeight(size: size.height * 0.18),

            ///****************************************** button *****************************************
            CustomButton(
                text: "Next",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Get.to(() => const CustomerInfoView(), transition: Transition.rightToLeft);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
