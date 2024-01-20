import 'package:blumonpay_test/core/utils/debugprint.dart';
import 'package:blumonpay_test/src/domain/secure_storage/secure_storage_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageServiceImpl extends SecureStorageService {
  FlutterSecureStorage getFlutterSecureStorage() {
    return const FlutterSecureStorage();
  }

  @override
  Future<String?> getValue(String key) async {
    final storage = getFlutterSecureStorage();
    try {
      final read = await storage.read(key: key);
      DebPrint.log('Obteniendo $key : $read');
      return read;
    } on PlatformException catch (_) {
      await storage.deleteAll();
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<bool> removeKey(String key) async {
    try {
      final storage = getFlutterSecureStorage();
      DebPrint.log('Borrando $key');
      await storage.delete(key: key);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setKeyValue(String key, String value) async {
    try {
      final storage = getFlutterSecureStorage();
      DebPrint.log('Guardando $key: con value : $value');
      await storage.write(key: key, value: value);
    } catch (e) {
      rethrow;
    }
  }
}
