import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return "Digite seu e-mail";
  }
  if (!email.isEmail) {
    return "Digite um e-mail válido";
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return "Digite sua senha";
  }
  if (password.length < 7) {
    return "Senha muito curta";
  }
  return null;
}

String? nameValidator(String? name){
  if (name == null || name.isEmpty) {
    return "Digite seu nome";
  }

  final names = name.split(" ");

  if(names.length == 1){
    return "Digite seu nome completo";
  }

  return null;
}

String? phoneValidator(String? phone){

  if (phone == null || phone.isEmpty) {
    return "Digite seu celular";
  }

  if(phone.length < 13 || !phone.isPhoneNumber){
    return "Digite um celular válido";
  }

  return null;
}

String? cpfValidator(String? cpf){

  if(cpf == null || cpf.isEmpty){
    return "Digite seu cpf";
  }

  if(!cpf.isCpf){
    return "Digite um cpf válido";
  }
}
