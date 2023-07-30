import 'package:advice/features/advice/domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel(super.id, super.advice);
  // AdviceModel({required int id, required String advice}) : super(id, advice);

  factory AdviceModel.fromJson(Map<String, dynamic> json) =>
      AdviceModel(json['advice_id'], json['advice']);
}
