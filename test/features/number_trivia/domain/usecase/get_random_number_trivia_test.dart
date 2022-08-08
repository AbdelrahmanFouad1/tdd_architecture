import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_architecture/core/usecase/use_case.dart';
import 'package:tdd_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_architecture/features/number_trivia/domain/repositories/numer_trivia_repositories.dart';
import 'package:tdd_architecture/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:tdd_architecture/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia? useCase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    useCase = GetRandomNumberTrivia(mockNumberTriviaRepository!);
  });

  const tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test('should get trivia from the repositories', () async {
    // arrange
    when(mockNumberTriviaRepository!.getRandomNumberTrivia())
        .thenAnswer((_) async => const Right(tNumberTrivia));

    // act
    final result = await useCase!(NoParams());

    // assert
    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository!.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
