import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rockllection/utils/storage/secure_storage.dart';

part 'token_provider.g.dart';

@Riverpod(keepAlive: true)
Token token(TokenRef ref) => Token(ref);

abstract class TokenProtocol {
  Future<void> remove();
  Future<void> saveToken({
    required String idToken,
    required String accessToken,
  });
  Future<LoginTokens?> fetchToken();
}

class Token implements TokenProtocol {
  Token(this.ref);

  final Ref ref;
  LoginTokens? _tokens;

  @override
  Future<void> remove() async {
    _tokens = null;

    try {
      await SecureStorage.delete(key: 'idToken');
      await SecureStorage.delete(key: 'accessToken');
    } on Exception {}
  }

  @override
  Future<void> saveToken({
    required String idToken,
    required String accessToken,
  }) async {
    _tokens = LoginTokens(idToken: idToken, accessToken: accessToken);

    try {
      await SecureStorage.write(key: 'idToken', value: idToken);
      await SecureStorage.write(key: 'accessToken', value: accessToken);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<LoginTokens?> fetchToken() async {
    final idToken = await SecureStorage.read(key: 'idToken');
    final accessToken = await SecureStorage.read(key: 'accessToken');
    final tokenValue = idToken != null && accessToken != null
        ? LoginTokens(idToken: idToken, accessToken: accessToken)
        : null;
    try {
      if (tokenValue != null) {
        _tokens = tokenValue;

        final aFlag = JwtDecoder.isExpired(idToken!);
        if (aFlag) {
          _tokens = null;
        }
      }
    } on Exception {
      return _tokens;
    }

    return _tokens;
  }
}

class LoginTokens {
  final String idToken;
  final String accessToken;

  LoginTokens({
    required this.idToken,
    required this.accessToken,
  });
}
