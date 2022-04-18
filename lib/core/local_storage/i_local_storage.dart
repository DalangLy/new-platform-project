abstract class ILocalStorage{
  Future<bool> save({required String name, required String data});
}