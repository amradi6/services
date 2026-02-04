import 'package:dartz/dartz.dart';
import 'package:services/data/network/failure.dart';
import 'package:services/data/network/requests.dart';
import 'package:services/domain/model/models.dart';
import 'package:services/domain/repository/repository.dart';
import 'package:services/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
    LoginUseCaseInput input,
  ) async {
    return await _repository.login(
      LoginRequest(email: input.email, password: input.password),
    );
  }
}

class LoginUseCaseInput {
  final String email;
  final String password;

  LoginUseCaseInput(this.email, this.password);
}
