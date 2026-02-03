import 'package:dartz/dartz.dart';
import 'package:services/data/network/failure.dart';
import 'package:services/data/network/requests.dart';
import 'package:services/domain/model/models.dart';

abstract class Repository {
 Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
}