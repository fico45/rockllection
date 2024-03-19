import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_template/utils/storage/secure_storage.dart';

part 'token_provider.g.dart';

@Riverpod(keepAlive: true)
TokenProvider tokenProvider(TokenProviderRef ref) => TokenProvider(ref);

abstract class TokenProviderProtocol {
  Future<void> remove();
  Future<void> saveToken(String token);
  Future<String?> fetchToken();
}

class TokenProvider implements TokenProviderProtocol {
  TokenProvider(this.ref);

  final Ref ref;
  String? _token;

  @override
  Future<void> remove() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();

    try {
      await SecureStorage.delete(key: StoreKey.token.toString());
    } on Exception {}

    await prefs.remove(StoreKey.user.toString());
  }

  @override
  Future<void> saveToken(String token) async {
    _token = token;

    try {
      await SecureStorage.write(key: StoreKey.token.toString(), value: token);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<String?> fetchToken() async {
    String? tokenValue;

    tokenValue = await SecureStorage.read(key: StoreKey.token.toString());

    try {
      if (tokenValue != null) {
        _token = tokenValue;

        final aFlag = JwtDecoder.isExpired(_token!);
        if (aFlag) {
          _token = null;
        }
      }
    } on Exception {
      return _token;
    }

    return _token;
  }
}

enum StoreKey {
  token,
  expireTime,
  user,
  locale,
}
