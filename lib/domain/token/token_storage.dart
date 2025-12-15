import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final _store = const FlutterSecureStorage();

  // -----------------------------
  // Save tokens
  // -----------------------------
  Future<void> saveTokens(String access, String refresh, String role) async {
    await _store.write(key: "access", value: access);
    await _store.write(key: "refresh", value: refresh);
    await _store.write(key: "role", value: role);
  }

  Future<String?> getAccessToken() => _store.read(key: "access");
  Future<String?> getRefreshToken() => _store.read(key: "refresh");
  Future<String?> getRole() => _store.read(key: "role");

  Future<void> clear() => _store.deleteAll();

  // -----------------------------
  // Decode JWT without any package
  // -----------------------------
  String _decodeBase64(String str) {
    // Replace URL-safe chars
    str = str.replaceAll('-', '+').replaceAll('_', '/');

    // Fix missing padding
    switch (str.length % 4) {
      case 0:
        break;
      case 2:
        str += '==';
        break;
      case 3:
        str += '=';
        break;
      default:
        throw Exception("Invalid Base64");
    }

    return utf8.decode(base64Url.decode(str));
  }

  Map<String, dynamic>? _decodePayload(String token) {
    try {
      final parts = token.split(".");
      if (parts.length != 3) return null;

      final payload = _decodeBase64(parts[1]);
      return json.decode(payload);
    } catch (_) {
      return null; // invalid token
    }
  }

  // -----------------------------
  // Check if token is expired
  // -----------------------------
  bool isExpired(String token) {
    final payload = _decodePayload(token);

    if (payload == null) return true; // Treat invalid token as expired
    if (!payload.containsKey("exp")) return true; // No exp = treat as expired

    final exp = payload["exp"];
    final expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);

    return DateTime.now().isAfter(expiryDate);
  }
}
