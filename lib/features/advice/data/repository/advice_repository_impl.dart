import 'package:advice/core/entities/exceptions.dart';
import 'package:advice/core/entities/failure.dart';
import 'package:advice/features/advice/data/datasources/advice_remote_datasource.dart';

import 'package:advice/features/advice/domain/entities/advice_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/advice_repository.dart';

class AdviceRepositoryImpl extends AdviceRepository {
  final AdviceRemoteDataSource adviceRemoteDataSource;

  AdviceRepositoryImpl(this.adviceRemoteDataSource);
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    try {
      final result = await adviceRemoteDataSource.getRandomAdviceFromApi();
      return Right(result);
    } on ServerException catch (_) {
      return Left(ServerFailure(''));
    } catch (_) {
      return const Left(GeenralFailure(''));
    }
  }
}
