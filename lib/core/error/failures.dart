import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// General failures.
class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'Ocurrió un error inesperado']);
}
