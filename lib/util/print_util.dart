import 'package:fish_redux/fish_redux.dart';

printl(Object object){
  if(isDebug()){
    print('-------------------------');
    print(object);
    print('-------------------------');
  }
}