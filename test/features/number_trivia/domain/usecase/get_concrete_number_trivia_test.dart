import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_architecture/features/number_trivia/domain/repositories/numer_trivia_repositories.dart';
import 'package:tdd_architecture/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
   GetConcreteNumberTrivia? useCase;
   MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    useCase = GetConcreteNumberTrivia(mockNumberTriviaRepository!);
  });

  const  tNumber = 1;
  const tNumberTrivia =  NumberTrivia(number: 1, text: 'test');

  test('should get trivia for the number from the repositories',
          () async {
    when(mockNumberTriviaRepository!.getConcreteNumberTrivia(any!))
        .thenAnswer((_) async => const Right(tNumberTrivia)) ;


    final result = await useCase!(const NumberTriviaParams(number: tNumber));

    expect(result, const Right(tNumberTrivia));

    verify(mockNumberTriviaRepository!.getConcreteNumberTrivia(tNumber));
  });
}
