import 'dart:async';

import 'package:control/control.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template_name/src/feature/authentication/controller/authentication_state.dart';
import 'package:flutter_template_name/src/feature/authentication/data/authentication_repository.dart';
import 'package:flutter_template_name/src/feature/authentication/model/sign_in_data.dart';
import 'package:flutter_template_name/src/feature/authentication/model/user.dart';

final class AuthenticationController extends StateController<AuthenticationState>
    with DroppableControllerHandler {
  AuthenticationController({
    required this.repository,
    super.initialState = const AuthenticationState.idle(user: User.unauthenticated()),
  }) {
    userSubscription = repository
        .userChanges()
        .where((user) => !identical(user, state.user))
        .map<AuthenticationState>((u) => AuthenticationState.idle(user: u))
        .listen(setState, cancelOnError: false);
  }

  final IAuthenticationRepository repository;
  StreamSubscription<AuthenticationState>? userSubscription;

  /// Restore the session from the cache.
  void restore() => handle(
    () async {
      setState(AuthenticationState.processing(user: state.user, message: 'Restoring session...'));
      final user = await repository.restore();
      setState(AuthenticationState.idle(user: user ?? const User.unauthenticated()));
    },
    error: (error, _) async {
      setState(
        AuthenticationState.idle(
          user: state.user,
          // ErrorUtil.formatMessage(error)
          error: kDebugMode ? 'Restore Error: $error' : 'Restore Error',
        ),
      );
    },
  );

  /// Sign in with the given [data].
  void signIn(SignInData data) => handle(
    () async {
      if (state.user.isAuthenticated) {
        AuthenticationState.processing(user: state.user, message: 'Logging out...');
        await repository.signOut().onError((_, __) {
          /* Ignore */
        });
        const AuthenticationState.processing(
          user: User.unauthenticated(),
          message: 'Successfully logged out.',
        );
      }
      setState(AuthenticationState.processing(user: state.user, message: 'Logging in...'));
      final user = await repository.signIn(data);
      setState(AuthenticationState.idle(user: user, message: 'Successfully logged in.'));
    },
    error: (error, _) async {
      setState(
        AuthenticationState.idle(
          user: state.user,
          // ErrorUtil.formatMessage(error)
          error: kDebugMode ? 'Sign In Error: $error' : 'Sign In Error',
        ),
      );
    },
  );

  /// Sign out.
  void signOut() {
    handle(
      () async {
        //if (state.user.isNotAuthenticated) return; // Already signed out.
        setState(AuthenticationState.processing(user: state.user, message: 'Logging out...'));
        await repository.signOut();
        setState(const AuthenticationState.idle(user: User.unauthenticated()));
      },
      error: (error, _) async {
        setState(
          AuthenticationState.idle(
            user: const User.unauthenticated(),
            // ErrorUtil.formatMessage(error)
            error: kDebugMode ? 'Log Out Error: $error' : 'Log Out Error',
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    userSubscription?.cancel();
    super.dispose();
  }
}
