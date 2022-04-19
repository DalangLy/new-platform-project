abstract class ILocalStorage{
  Future<bool> save({required String key, required List<String> value});
  Future<List<String>> get({required String key});
}