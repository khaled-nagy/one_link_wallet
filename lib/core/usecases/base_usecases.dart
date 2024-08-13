import 'package:dartz/dartz.dart';

abstract class WithParamsFutureUsecase<T, Params> {
  Future<Either<Exception, T>> call(Params params);
}

abstract class NoParamsFutureUsecase<T> {
  Future<Either<Exception, T>> call();
}

