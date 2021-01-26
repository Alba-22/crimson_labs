// File for common validation functions

// ===================================
// Validations for Login Module
// ===================================
String validateEmail(String value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.isEmpty || value == null) {
    return "Invalid email!";
  }
  else if (!regExp.hasMatch(value.trim())) {
    return "Invalid email!";
  }
  return null;
}

String validatePassword(String value) {
  if (value.trim() == "") {
    return "Invalid password!";
  } 
  else if (value.trim().length < 8) {
    return "Password too short!";
  }
  return null;
}

// ===================================
// Validations for Products Module
// ===================================
String validateProductName(String value) {
  if (value.trim() == "" || value.trim().length < 2) {
    return "Invalid name!";
  }
  return null;
}

String validateProductDescription(String value) {
  if (value.trim() == "" || value.trim().length < 2) {
    return "Invalid description!";
  }
  return null;
}

String validateProductPrice(String value, String placeholder) {
  final price = double.tryParse(value.trim().replaceAll(placeholder, "").replaceAll(".", "").replaceAll(",", "."));
  if (price == null) {
    return "Invalid value!";
  }
  else if (price == 0) {
    return "Invalid value!";
  }
  return null;
}