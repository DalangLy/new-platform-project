import 'package:platform_project_new/core/core_export.dart';
import 'package:platform_project_new/core/errors/unknown_failure.dart';
import 'package:platform_project_new/core/local_storage/i_local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DLocalStorage implements ILocalStorage{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Future<bool> save({required String name, required String data}) async{
    try{
      final SharedPreferences prefs = await _prefs;
      final bool _isSaved = await prefs.setString(name, data);
      return _isSaved;
    }on Failure{
      rethrow;
    }
    catch(e){
      throw UnknownFailure(message: e.toString());
    }
  }
}