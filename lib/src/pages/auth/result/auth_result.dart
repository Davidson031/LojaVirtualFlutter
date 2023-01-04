import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quitanda_virtual/src/models/user_model.dart';
part 'auth_result.freezed.dart';


@freezed
class AuthResult with _$AuthResult{
  factory AuthResult.sucess(UserModel user) = Success;
  factory AuthResult.fail(String message) = Error;
}