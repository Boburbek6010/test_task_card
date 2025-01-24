import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/card_entity.dart';

abstract class CardRepository {
  Future<Either<Failure, CardEntity>> scanCardWithCamera();
  Future<Either<Failure, CardEntity>> readCardWithNfc();
  Future<bool> validateCard(CardEntity card);
}