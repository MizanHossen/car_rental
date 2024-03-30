import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/common_controller.dart';
import '../controller/vichicle_info_controller.dart';
import '../helpers/constants/constants.dart';
import '../widgets/back_button.dart';
import '../widgets/container_widget.dart';
import '../widgets/row_text_info.dart';
import '../widgets/title_widget.dart';

class SummeryDetails extends StatelessWidget {
  const SummeryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final VehicleInfoController vehicleInfoController = Get.put(VehicleInfoController());
    final CommonController commonController = Get.put(CommonController());
    double calculateInformation() {
      double dailyRate = vehicleInfoController.selectedCarModel.value.rates!.daily!.toDouble();
      int duration = int.parse(commonController.duration.value); // Assuming duration is in days
      return dailyRate * duration;
    }

    double total() {
      double weekRate = vehicleInfoController.selectedCarModel.value.rates!.weekly!.toDouble();
      double selectPrice = double.parse(commonController.selectedPrice.value);
      return commonController.selectedCurrency == "\$"
          ? calculateInformation() + weekRate + selectPrice
          : (calculateInformation() + weekRate) * (selectPrice / 100);
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Align(alignment: Alignment.centerLeft, child: CustomBackButton()),
              gapHeight(size: size.height * 0.02),

              ///**************************************************** Reservation Details *********************************************
              const TitleWidget(title: "Reservation Details"),
              const SizedBox(height: 10),
              ContainerWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowTextInfo(
                      title: "Reservation ID",
                      titleStyle: kTitleTextStyle,
                      information: commonController.reservationIdController.text, // "2023-08-01 10:31:47",
                      informationStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    gapHeight(size: 10),
                    RowTextInfo(
                      title: "Pickup Date",
                      titleStyle: kTitleTextStyle,
                      information: DateFormat('yyyy-MM-dd').format(commonController.pickupDate.value), // "2023-08-01 10:31:47",
                      informationStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    gapHeight(size: 10),
                    RowTextInfo(
                      title: "Dropoff Date",
                      titleStyle: kTitleTextStyle,
                      information: DateFormat('yyyy-MM-dd').format(commonController.returnDate.value), // "2023-08-01 10:31:47",
                      informationStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),

              gapHeight(size: size.height * 0.02),

              ///**************************************************** Customer Information *********************************************
              const TitleWidget(title: "Customer Information"),
              const SizedBox(height: 10),
              ContainerWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowTextInfo(
                      title: "First Name",
                      titleStyle: kTitleTextStyle,
                      information: commonController.firstNameController.text, // "2023-08-01 10:31:47",
                      informationStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    gapHeight(size: 10),
                    RowTextInfo(
                      title: "Last Name",
                      titleStyle: kTitleTextStyle,
                      information: commonController.lastNameController.text, // "2023-08-01 10:31:47",
                      informationStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    gapHeight(size: 10),
                    RowTextInfo(
                      title: "Email",
                      titleStyle: kTitleTextStyle,
                      information: commonController.emailController.text, // "2023-08-01 10:31:47",
                      informationStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    gapHeight(size: 10),
                    RowTextInfo(
                      title: "Phone",
                      titleStyle: kTitleTextStyle,
                      information: commonController.phoneController.text, // "2023-08-01 10:31:47",
                      informationStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              gapHeight(size: size.height * 0.02),

              ///**************************************************** Vehicle Information *********************************************
              const TitleWidget(title: "Vehicle Information"),
              const SizedBox(height: 10),
              ContainerWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowTextInfo(
                      title: "Vehicle Type",
                      titleStyle: kTitleTextStyle,
                      information: vehicleInfoController.selectedCarModel.value.type.toString(), // "2023-08-01 10:31:47",
                      informationStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    gapHeight(size: 10),
                    RowTextInfo(
                      title: "Vehicle Model",
                      titleStyle: kTitleTextStyle,
                      information: vehicleInfoController.selectedCarModel.value.model.toString(), // "2023-08-01 10:31:47",
                      informationStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              gapHeight(size: size.height * 0.02),

              ///**************************************************** Charges Summary *********************************************
              const TitleWidget(title: "Charges Summary"),
              const SizedBox(height: 10),
              ContainerWidget(
                color: kContainerColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowTextInfo(
                      title: "Charge",
                      titleStyle: kTitleTextStyle,
                      information: "Total", // "2023-08-01 10:31:47",
                      informationStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const Divider(color: kPrimaryColor),
                    gapHeight(size: 10),
                    RowTextInfo(
                      title: "Weekly (1 week)",
                      titleStyle: kTitleTextStyle,
                      information: "\$${vehicleInfoController.selectedCarModel.value.rates!.weekly}", // "2023-08-01 10:31:47",
                      informationStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    gapHeight(size: 10),
                    RowTextInfo(
                      title: "Daily (${commonController.duration} days)",
                      titleStyle: kTitleTextStyle,
                      information: "\$${calculateInformation()}", // "2023-08-01 10:31:47",
                      informationStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    gapHeight(size: 10),
                    RowTextInfo(
                      title: commonController.selectedOption.toString(),
                      titleWidth: 150,
                      titleStyle: kTitleTextStyle,
                      information: commonController.selectedCurrency == "\$"
                          ? "${commonController.selectedCurrency} ${commonController.selectedPrice.toString()}"
                          : "${commonController.selectedPrice.toString()} ${commonController.selectedCurrency}",
                      // "2023-08-01 10:31:47",
                      informationStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    gapHeight(size: 10),
                    RowTextInfo(
                      title: "Net Total",
                      titleStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                      information: "\$${total()}", // "2023-08-01 10:31:47",
                      informationStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              gapHeight(size: size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
