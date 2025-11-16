import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_project/src/common/util/api_client.dart';
import 'package:flutter_project/src/feature/authentication/model/sign_in_data.dart';
import 'package:flutter_project/src/feature/authentication/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class IAuthenticationRepository {}

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  AuthenticationRepositoryImpl({
    required final SharedPreferences sharedPreferences,
    required final ApiClient apiClient,
  }) : _sharedPreferences = sharedPreferences,
       _apiClient = apiClient;

  final SharedPreferences _sharedPreferences;
  final ApiClient _apiClient;
}

class AuthenticationRepositoryFake implements IAuthenticationRepository {}
