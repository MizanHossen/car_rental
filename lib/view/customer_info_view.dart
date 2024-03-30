import 'package:car_rental/helpers/constants/validation_class.dart';
import 'package:car_rental/view/vehicle_info_view.dart';
import 'package:car_rental/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/common_controller.dart';
import '../helpers/constants/constants.dart';
import '../widgets/CustomButton.dart';
import '../widgets/container_widget.dart';
import '../widgets/simple_input_field.dart';
import '../widgets/title_widget.dart';

class CustomerInfoView extends StatelessWidget {
  const CustomerInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final CommonController commonController = Get.put(CommonController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Align(alignment: Alignment.centerLeft, child: CustomBackButton()),
              gapHeight(size: size.height * 0.088),

              ///************************************************** title ******************************************
              const TitleWidget(title: "Customer Information"),
              const SizedBox(height: 20),

              ///************************************************** customer details ******************************************
              ContainerWidget(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ///*************************** first name *************************
                      SimpleInputField(
                        controller: commonController.firstNameController,
                        hintText: "",
                        needValidation: true,
                        errorMessage: "",
                        fieldTitle: "First Name",
                        validatorClass: ValidatorClass().validateName,
                      ),
                      gapHeight(size: 10),

                      ///*************************** last name *************************
                      SimpleInputField(
                        controller: commonController.lastNameController,
                        hintText: "",
                        needValidation: true,
                        errorMessage: "",
                        fieldTitle: "Last Name",
                        validatorClass: ValidatorClass().validateName,
                      ),
                      gapHeight(size: 10),

                      ///*************************** email *************************
                      SimpleInputField(
                        controller: commonController.emailController,
                        hintText: "",
                        needValidation: true,
                        errorMessage: "",
                        fieldTitle: "Email",
                        validatorClass: ValidatorClass().validateEmail,
                        inputType: TextInputType.emailAddress,
                      ),
                      gapHeight(size: 10),

                      ///*************************** phone *************************
                      SimpleInputField(
                        controller: commonController.phoneController,
                        hintText: "",
                        needValidation: true,
                        errorMessage: "",
                        fieldTitle: "Phone",
                        validatorClass: ValidatorClass().validateNumber,
                        inputType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
              gapHeight(size: size.height * 0.24),

              ///****************************************** button *****************************************
              CustomButton(
                  text: "Next",
                  onTap: () {
                    if(formKey.currentState!.validate()){
                      Get.to(()=> const VehicleInfoView(), transition: Transition.rightToLeft);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
