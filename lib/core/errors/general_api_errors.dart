class SocketApiException implements Exception {
  @override
  String toString() => 'Error en la red, verifique su conexión a Internet';
}

class TimeoutApiException implements Exception {
  @override
  String toString() =>
      'Se agoto tiempo de consulta, verifique su conexión a Internet';
}

class ErrorApiException implements Exception {
  final String error;
  ErrorApiException(this.error);
  @override
  String toString() => 'Upps ocurrio un error,\n $error';
}
