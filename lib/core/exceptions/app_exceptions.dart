class AuthException implements Exception {
  final String? error;

  AuthException({this.error});
}

class ForbiddenException implements Exception {
  final String? error;

  ForbiddenException({this.error});
}

class ExceptionWithMessage implements Exception {
  final String message;

  ExceptionWithMessage(this.message);
}

class InternalServerException implements Exception {}

class NetworkException implements Exception {}

class TimeoutException implements Exception {}

class UnknownException implements Exception {}

class LocalDatabaseException implements Exception {}

class NotFoundException implements Exception {}

class PaymentException implements Exception {}

class ParsingException implements Exception {}

class InvalidCartException implements Exception {}
