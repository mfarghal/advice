import 'package:dartz/dartz.dart';

import '../../../../core/entities/failure.dart';

import '../entities/advice_entity.dart';
import '../repository/advice_repository.dart';

class AdviceUseCases {
  final AdviceRepository adviceRepository;

  AdviceUseCases(this.adviceRepository);

  ///
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    //
    // call repository to get data { failure or data }
    final r = await adviceRepository.getAdviceFromDataSource();
    // proceed with business logic { manipulate the data }
    return r;
  }
}
