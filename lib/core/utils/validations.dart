import 'debugprint.dart';

abstract class Validations {
  static String? name({required String name}) {
    if (name.isEmpty) {
      return 'Nombre no puede estar vacio';
    }
    if (name.trim().length <= 2) {
      return 'Escribe tu nombre, campo invalido';
    }
    return null;
  }

  static String? email({required String email}) {
    if (email.isEmpty) {
      return 'Correo no puede estar vacio';
    }
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(email.trim())) {
      return 'Correo no valido';
    }

    return null;
  }

  static String? user({required String user}) {
    if (user.isEmpty) {
      return "Usuario no puede estar vacio";
    }
    if (user.trim().length <= 2) {
      return 'Escribe tu usuario, campo invalido';
    }
    return null;
  }

  static String? search({required String text}) {
    if (text.isEmpty) {
      return "Busqueda no puede estar vacio";
    }
    if (text.trim().length <= 2) {
      return 'Campo invalido';
    }
    return null;
  }

  static String? password({required String password}) {
    if (password.isEmpty) {
      return 'Contraseña no puede estar vacia';
    }
    if (password.trim().length < 6) {
      return "Contraseña debe ser de 6 caracteres";
    }
    return null;
  }

  static String? passwordRep(
      {required String password, required String passwordRep}) {
    DebPrint.log(password);
    DebPrint.log(passwordRep);
    if (passwordRep.isEmpty) {
      return 'Contraseña no puede estar vacia';
    }
    if (passwordRep.length < 6) {
      return 'Contraseña debe ser de 6 caracteres';
    }
    if (passwordRep != password) {
      return 'Las contraseñas no son identicas';
    }
    return null;
  }
}
