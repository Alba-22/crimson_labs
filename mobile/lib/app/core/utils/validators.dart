// File for common validation functions

String validateEmail(String value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.isEmpty || value == null) {
    return "Email Inválido!";
  }
  else if (!regExp.hasMatch(value.trim())) {
    return "Email Inválido!";
  }
  return null;
}

String validatePassword(String value) {
  if (value.trim() == "") {
    return "Senha Inválida!";
  } 
  else if (value.trim().length < 8) {
    return "Senha muito curta!";
  }
  return null;
}