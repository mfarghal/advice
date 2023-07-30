import 'package:dartz/dartz.dart';

import '../../../../core/entities/failure.dart';
import '../entities/advice_entity.dart';

abstract class AdviceRepository {
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource();
}
