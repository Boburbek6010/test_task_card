import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class CameraFailure extends Failure {}
class NfcFailure extends Failure {}
class GeneralFailure extends Failure {}
class ValidationFailure extends Failure {}