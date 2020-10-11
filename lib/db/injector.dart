import 'package:kiwi/kiwi.dart';

import 'irepository/imember_repository.dart';
import 'irepository/unit_of_work/iunit_of_work.dart';
import 'repository/member_repository.dart';
import 'repository/unit_of_work/unit_of_work.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.factory(IMemberRepository, from: MemberRepository)
  void configure();

  @Register.factory(IUnitOfWork, from: UnitOfWork, constructorName: 'mobile')
  void sqfliteMod();

}

void setup() {
   var injector=_$Injector();
   injector.configure();
   injector.sqfliteMod();
}
