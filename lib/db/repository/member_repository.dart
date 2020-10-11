import '../../db/irepository/imember_repository.dart';
import '../../model/db/member.dart';
import '../../db/irepository/unit_of_work/iunit_of_work.dart';

import 'base/base_repository.dart';

class MemberRepository extends BaseRepository<Member>
    implements IMemberRepository {
  IUnitOfWork _unitOfWork;
 
  MemberRepository(
      IUnitOfWork unitOfWork)
      : super(unitOfWork) {
    _unitOfWork = unitOfWork;
  }

}
