import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color white = Colors.white;
Color black = Colors.black;
LinearGradient bgColor = LinearGradient(
  colors: [
    const Color(0xFF019DA2),
    const Color(0xFF009CFF).withOpacity(0.8),
  ],
  begin: Alignment.topLeft, //begin of the gradient color
  end: const Alignment(0.3, 0.3), //end of the gradient color
  //stops: [0, 0.8]
);

const Color textColor = Color(0xFFFFFFFF);

// Color kLightkPrimaryColor = Colors.blue.shade900.withOpacity(0.85);
Color kLightkPrimaryColor = const Color(0xffF5F5F5);

DateFormat dateFormat = DateFormat('dd-MM-yy');
DateFormat timeFormat = DateFormat('hh:mm:ss a');
NumberFormat numberFormat = NumberFormat('#,##,000.0#');

DateTime get getCurrentDateTime => DateTime.now();
String get getCurrentFormattedDate => dateFormat.format(DateTime.now());
String get getCurrentFormattedTime => timeFormat.format(DateTime.now());

//WebView User Agent
const String webViewUserAgent =
    'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.192 Safari/537.36';

final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
final RegExp phoneValidatorRegExp =
    RegExp(r'^([0-9]{9})|([A-Za-z0-9._%\+\-]+@[a-z0-9.\-]+\.[a-z]{2,3})$');
final RegExp stringIsUrlRegExp = RegExp(
    r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)');

//SignUp Form Error
const String kEmailNullError = 'Please Enter your email';
const String kInvalidEmailError = 'Please Enter Valid Email';
const String kPassNullError = 'Please Enter your password';
const String kShortPassError = 'Password is too short';
const String kMatchPassError = "Passwords don't match";
const String kInvaliedInfoError = 'Email or Password Invalied';
const String kFirstNameNullError = 'Please Enter your first name';
const String kLastNameNullError = 'Please Enter your last name';
const String kPhoneNumberNullError = 'Please Enter your phone number';
const String kInvaliedPhoneNumberError = 'Please Enter valid phone number';
const String kAddressNullError = 'Please Enter your address';
const String kCountryNullError = 'Please Select your Country';
const String kStateNullError = 'Please Select your State';

//Colors
const kPrimaryColor = Color(0xff5D5CFF);
const kBorderColor = Color(0xffD7D7FF);
const kContainerColor = Color(0xffDFDFFF);
const kSecounderyColor = Color(0xffFEF7E1);
const kBackgroundColor = Color(0xffFFFFFF);
const kTextColor = Color(0xff353535);
const kSecounderyTextColor = Color(0xff494A4B);
const kDividerColor = Color(0xffE4E4E4);
const kActiveStatus = Color(0xff22C375);
const kShadowColor = Color(0xffF4F2EC);


// Text Style
TextStyle kHeadingTextStyle = const TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w900,
  color: kTextColor,
);

TextStyle kTitleTextStyle = TextStyle(
  fontSize: 15.0,
  color: kTextColor.withOpacity(0.84),
  fontWeight: FontWeight.w400,
);

TextStyle kFieldTextStyle =  const TextStyle(
  fontSize: 12.0,
  color: kSecounderyTextColor,
  fontWeight: FontWeight.w600,
);

// ignore: camel_case_types, must_be_immutable
class gapHeight extends StatelessWidget {
  double size;
  gapHeight({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}

// ignore: must_be_immutable, camel_case_types
class gapWidth extends StatelessWidget {
  double size;
  gapWidth({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size);
  }
}
