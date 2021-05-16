import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  List get properties => const <dynamic>[];
  // ignore: avoid_unused_constructor_parameters
  const Failure([properties]);

  @override
  List<Object> get props => [properties];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class NotFoundFailure extends Failure {}
