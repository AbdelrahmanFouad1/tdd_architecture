import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  List? properties;

  Failure([properties = const <dynamic>[]]) : super();

  @override
  List<Object> get props => [properties!];
}