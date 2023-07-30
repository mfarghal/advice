import 'package:advice/core/entities/failure.dart';
import 'package:advice/features/advice/2_domain/entities/advice_entity.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    // call repository to get data { failure or data }
    // proceed with business logic { manipulate the data }
    await Future.delayed(const Duration(seconds: 2));
    return const Right(AdviceEntity(1, 'fake advice to test'));
  }
}
