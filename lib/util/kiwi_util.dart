import 'package:kiwi/kiwi.dart';

T kiwi<T>() {
  KiwiContainer container = KiwiContainer();
  return container.resolve<T>();
}
