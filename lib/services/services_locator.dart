import 'package:english/data/repository/auth/auth_repository.dart';
import 'package:english/data/repository/grammar/grammar_repository.dart';
import 'package:english/data/repository/user/user_repository.dart';
import 'package:get_it/get_it.dart';


final GetIt getIt = GetIt.instance;

void setUpDI(){
  getIt.registerFactory<AuthRepository>(()=>AuthRepository());
  getIt.registerFactory<UserRepository>(()=>UserRepository());
  getIt.registerFactory<GrammarRepository>(()=>GrammarRepository());
}