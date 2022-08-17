
class CustomFormFieldValidator{

  required(field){
    if(field==null || field=='') return 'required' ;
    return null;
  }

  email(var email){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if(emailValid) return null;
    return 'invalid email ';
  }

  password(var password){
    if(password==null){

      return 'required';

    }else if(password.length<6){

      return 'password should be at least 6 characters';

    }else{

      return null;
    }
  }

  confirmPassword(String password, String confirmPassword){
    if((password.isNotEmpty && confirmPassword.isNotEmpty) && password==confirmPassword){
      return null;
    }
    return "password didn't match";
  }

}