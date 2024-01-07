import 'package:equatable/equatable.dart';

import '../constant/messages_constants.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? errorCode;
  const Failure(this.message, this.errorCode);

  @override
  List<Object> get props => [message];
}

class FailureResponse extends Failure {
  const FailureResponse(String message) : super(message, null);
}

class LocalDatabaseQueryFailure extends Failure {
  const LocalDatabaseQueryFailure(String message) : super(message, null);
}

class RemoteFailure extends Failure {
  const RemoteFailure(int? errorCode, String message) : super(message, errorCode);
}

class ExceptionFailure extends Failure {
  const ExceptionFailure(dynamic error) : super('$error', null);
}
