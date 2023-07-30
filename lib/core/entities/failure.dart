import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);

  @override
  List<Object?> get props => [];
}

class GeenralFailure extends Failure {
  const GeenralFailure(super.message);

  @override
  List<Object?> get props => [];
}
