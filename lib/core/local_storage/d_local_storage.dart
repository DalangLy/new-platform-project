import 'package:shared_preferences/shared_preferences.dart';
import '../../abstraction/abstraction_export.dart';
import '../core_export.dart';

class DLocalStorage implements ILocalStorage{
  final Future<SharedPreferences> _prefs;
  DLocalStorage(this._prefs);
  @override
  Future<bool> save({required String key, required List<String> value}) async{
    try{
      final SharedPreferences prefs = await _prefs;
      final bool _isSaved = await prefs.setStringList(key, value);
      return _isSaved;
    }on Failure{
      rethrow;
    }
    catch(e){
      throw UnknownFailure(message: e.toString());
    }
  }

  @override
  Future<List<String>> get({required String key}) async{
    try{
      final SharedPreferences prefs = await _prefs;
      final List<String> data = prefs.getStringList(key) ?? [];
      return data;
    }on Failure{
      rethrow;
    }
    catch(e){
      throw UnknownFailure(message: e.toString());
    }
  }
}