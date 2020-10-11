// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<IMemberRepository>(
        (c) => MemberRepository(c<IUnitOfWork>()));
  }

  void sqfliteMod() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<IUnitOfWork>((c) => UnitOfWork.mobile());
  }
}
