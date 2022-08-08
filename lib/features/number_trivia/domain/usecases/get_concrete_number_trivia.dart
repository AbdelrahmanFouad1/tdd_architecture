import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_architecture/core/error/failure.dart';
import 'package:tdd_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_architecture/features/number_trivia/domain/repositories/numer_trivia_repositories.dart';

import '../../../../core/usecase/use_case.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, NumberTriviaParams> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NumberTriviaParams params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class NumberTriviaParams extends Equatable {
  final int number;

  const NumberTriviaParams({required this.number});

  @override
  List<Object?> get props => [
        number,
      ];
}
