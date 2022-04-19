import 'package:get_it/get_it.dart';
import 'sub_injectors/di_external_resources.dart';

GetIt getIt = GetIt.instance;

Future<void> injector() async {
  DIExternalResources(getIt: getIt);
}