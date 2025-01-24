import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/card_validators.dart';
import '../datasources/card_camera_datasource.dart';
import '../datasources/card_nfc_datasource.dart';
import '../entities/card_entity.dart';
import 'card_repository.dart';

class CardRepositoryImpl implements CardRepository {
  final CardCameraDataSource cameraDataSource;
  final CardNfcDataSource nfcDataSource;

  CardRepositoryImpl({
    required this.cameraDataSource,
    required this.nfcDataSource,
  });

  @override
  Future<Either<Failure, CardEntity>> scanCardWithCamera() async {
    try {
      final cardModel = await cameraDataSource.scanCard();
      if (await validateCard(cardModel)) {
        return Right(cardModel);
      } else {
        return Left(ValidationFailure());
      }
    } on CameraException {
      return Left(CameraFailure());
    } catch (e) {
      return Left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, CardEntity>> readCardWithNfc() async {
    try {
      final cardModel = await nfcDataSource.readCard();
      if (await validateCard(cardModel)) {
        return Right(cardModel);
      } else {
        return Left(ValidationFailure());
      }
    } on NfcException {
      return Left(NfcFailure());
    } catch (e) {
      return Left(GeneralFailure());
    }
  }

  @override
  Future<bool> validateCard(CardEntity card) async {
    if (!CardValidators.isValidPan(card.panNumber)) {
      return false;
    }

    if (!CardValidators.isValidExpiryDate(card.expiryDate)) {
      return false;
    }

    if (card.cardType == CardType.humo) {
      return card.panNumber.startsWith('9860');
    } else if (card.cardType == CardType.uzcard) {
      return card.panNumber.startsWith('8600');
    }

    return false;
  }
}