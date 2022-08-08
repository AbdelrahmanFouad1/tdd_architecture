import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_architecture/core/error/failure.dart';
import 'package:tdd_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_architecture/features/number_trivia/domain/repositories/numer_trivia_repositories.dart';

import '../../../../core/usecase/use_case.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}

