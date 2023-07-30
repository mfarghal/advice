import 'package:equatable/equatable.dart';

class AdviceEntity extends Equatable {
  final int id;
  final String advice;

  const AdviceEntity(this.id, this.advice);

  @override
  List<Object?> get props => [id, advice];
}
