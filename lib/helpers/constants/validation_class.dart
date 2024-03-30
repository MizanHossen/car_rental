class ValidatorClass {
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "please enter an email";
    } else if (!RegExp('^[a-zA-Z0-9_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)) {
      return "please enter valid email";
    }
    return null;
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return "please enter name";
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
      return "only alphabets allowed";
    }
    return null;
  }

  String? validateEmptyField(String? value) {
    if (value!.isEmpty) {
      return "field can't be empty";
    }
    return null;
  }

  String? validateNumber(String? value) {
    if (value!.isEmpty) {
      return "please enter mobile number";
    } else if (!RegExp(r'^01[3-9]\d{8}$').hasMatch(value)) {
      return "please enter valid number";
    }
    return null;
  }

  String? validatePrice(String? value) {
    if (value!.isEmpty) {
      return "please enter price";
    }
    return null;
  }

  String? validateId(String? value) {
    if (value!.isEmpty) {
      return "please enter id";
    }
    return null;
  }

  String? noValidationRequired(String? value) {
    return null;
  }

// void scrollToFirstError({required ScrollController scrollController , required GlobalKey<FormState> formKey}) {
//   final RenderObject? errorField = getErrorFieldRenderObject(formKey: formKey);
//   print("####################################################");
//   print(errorField.toString());
//   if (errorField != null) {
//     scrollController.animateTo(
//       errorField.semanticBounds.top,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }
// }
//
// RenderObject? getErrorFieldRenderObject({required GlobalKey<FormState> formKey}) {
//   RenderObject? errorField;
//   formKey.currentState!.fields.firstWhere((field) => field.hasError).focusNode
//   formKey.currentContext!.visitChildElements((element) {
//     print("****************EVERY ELEMENT*******************");
//     print(element.renderObject);
//     if (element.runtimeType ==  RenderEditable || element.runtimeType == RenderSemanticsGestureHandler ) {
//       print("****************FOUND OBJECT*******************");
//       print(element.toString());
//       errorField =  element.renderObject;
//     }
//   });
//   return errorField;
// }
}
