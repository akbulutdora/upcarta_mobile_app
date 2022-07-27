import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'dart:core';

import 'package:upcarta_mobile_app/core/services/value_failure.dart';

class EmailAddress extends Equatable {
  factory EmailAddress(String input) =>
      EmailAddress._(_validateEmailAddress(input));

  const EmailAddress._(this.value);

  final Either<ValueFailure, String> value;

  @override
  List<Object?> get props => [value];
}

Either<ValueFailure, String> _validateEmailAddress(String input) {
  const emailRegex =
  r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(
      ValueFailure.invalidEmail(failedValue: input),
    );
  }
}
class Password extends Equatable {
  factory Password(String input) => Password._(_validatePassword(input));

  const Password._(this.value);

  final Either<ValueFailure, String> value;

  @override
  List<Object?> get props => [value];
}

Either<ValueFailure, String> _validatePassword(String input) {
  if (input.length >= 8) {
    return right(input);
  } else {
    return left(
      ValueFailure.shortPassword(failedValue: input),
    );
  }
}
class Name extends Equatable {
  factory Name(String input) => Name._(_validateName(input));

  const Name._(this.value);

  final Either<ValueFailure, String> value;

  @override
  List<Object?> get props => [value];
}

Either<ValueFailure, String> _validateName(String input) {
  if (input.length > 0 && input.length<51) {
    return right(input);
  } else {
    return left(
      ValueFailure.invalidName(failedValue: input),
    );
  }
}
class Username extends Equatable {
  factory Username(String input) => Username._(_validateUsername(input));

  const Username._(this.value);

  final Either<ValueFailure, String> value;

  @override
  List<Object?> get props => [value];
}

Either<ValueFailure, String> _validateUsername(String input) {
  if (input.length > 0 && input.length<101 && RegExp(r'^[a-zA-Z0-9]').hasMatch(input)) {
    return right(input);
  } else {
    return left(
      ValueFailure.invalidUsername(failedValue: input),
    );
  }
}