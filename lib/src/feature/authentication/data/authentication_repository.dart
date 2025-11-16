import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_project/src/feature/authentication/model/sign_in_data.dart';
import 'package:flutter_project/src/feature/authentication/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class IAuthenticationRepository {}

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  AuthenticationRepositoryImpl({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;
}

class AuthenticationRepositoryFake implements IAuthenticationRepository {}
