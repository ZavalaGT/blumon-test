class GetMeException implements Exception {
  @override
  String toString() => 'Error al obtener perfil';
}

class UpdateException implements Exception {
  final String error;
  UpdateException(this.error);
  @override
  String toString() => 'Error al actualizar $error';
}

class DeleteException implements Exception {
  @override
  String toString() => 'Error al borrar perfil';
}

class LoginException implements Exception {
  @override
  String toString() => 'Error al inciar sesión';
}

class LoginApiException implements Exception {
  @override
  String toString() => 'Correo y/o contraseña inválidos';
}

class TokenApiException implements Exception {
  @override
  String toString() => 'Error al guardar token';
}

class RegisterErrorException implements Exception {
  final String error;
  RegisterErrorException(this.error);
  @override
  String toString() => 'Correo ya existe, inicia sesión';
}

class RegisterException implements Exception {
  final String error;
  RegisterException(this.error);
  @override
  String toString() => 'Error al crear perfil $error';
}

class ChangePasswordException implements Exception {
  @override
  String toString() => 'Error al cambiar contraseña perfil';
}

class LogoutException implements Exception {
  @override
  String toString() => 'Error al cerrar perfil';
}

class RequestCodeException implements Exception {
  @override
  String toString() => 'No existe el ususario';
}

class RecoveryCodeException implements Exception {
  @override
  String toString() => 'No existe el ususario o código inválido';
}
