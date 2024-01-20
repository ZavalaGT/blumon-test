abstract class SecureStorageService {
  Future<void> setKeyValue(String key, String value);

  Future<String?> getValue(String key);

  Future<bool> removeKey(String key);
}
