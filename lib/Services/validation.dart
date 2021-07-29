class Validation {

  String validateUserName(String value) {

    if(value.length<5)
    {
      return 'Please Enter your name';
    }
    return '';
  }

  String validateMobileNumber (String value) {
    if(value.length<11)
    {
      return 'Please Enter valid mobile number';
    }
    return '';
  }

  String validatePassword(String value){
    if(value.length<6)
    {
      return 'Password must be at least 6 characters';
    }
    return '';
  }

  String validateEmail (String value) {
    if(value.length<11 && !value.contains("@"))
    {
      return 'Please Enter valid Email';
    }
    return '';
  }

}