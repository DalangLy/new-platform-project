import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../abstraction/abstraction_export.dart';
import '../../config/config_export.dart';
import '../../core/core_export.dart';

class DIExternalResources {
  final GetIt getIt;

  DIExternalResources({required this.getIt}) {
    //*****************************
    //********* Shared Preferences **********
    getIt.registerLazySingleton((){
      return SharedPreferences.getInstance();
    });

    //*****************************
    //********* DHttpClient **********
    getIt.registerLazySingleton<IHttpClient>(() {
      return DHttpClient(
        getIt(),
        getIt(),
      );
    });

    //*****************************
    //********* Dio **********
    getIt.registerLazySingleton(() {
      return Dio(BaseOptions(baseUrl: baseUrl,));
    });

    //*****************************
    //********* Token Storage **********
    getIt.registerLazySingleton<ILocalStorage>(() {
      return DLocalStorage(getIt(),);
    });
  }
}