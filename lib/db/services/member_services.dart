import 'dart:async';
import '../../db/irepository/imember_repository.dart';
import '../../db/irepository/unit_of_work/iunit_of_work.dart';
import '../../db/iservices/imember_services.dart';
import '../../model/db/member.dart';

import 'base/base_services.dart';

class MemberServices with BaseServices<Member> implements IMemberServices {
  IMemberRepository _dal;
  IUnitOfWork _unitOfWork;
  
  MemberServices(IUnitOfWork unitOfWork, IMemberRepository dal) {
    _unitOfWork = unitOfWork;
    baseDal = dal;
    _dal = dal;
  }
}
