import 'package:get_it/get_it.dart';
import 'package:ice_app/domain/ports/ice_cream_repository.dart';
import 'package:ice_app/domain/ports/list_flavours.dart';
import 'package:ice_app/infra/dao/impl/coverage_dao_impl.dart';
import 'package:ice_app/infra/dao/impl/flavour_dao_impl.dart';
import 'package:ice_app/infra/dao/impl/holder_dao_impl.dart';
import 'package:ice_app/infra/dao/impl/ice_cream_dao_impl.dart';
import 'package:ice_app/infra/dao/interfaces/coverage_dao.dart';
import 'package:ice_app/infra/dao/interfaces/flavour_dao.dart';
import 'package:ice_app/infra/dao/interfaces/holder_dao.dart';
import 'package:ice_app/infra/dao/interfaces/ice_cream_dao.dart';
import 'package:ice_app/infra/dao/services/ice_cream_repository_impl.dart';
import 'package:ice_app/infra/dao/services/list_user_flavours_impl.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  /// DAO
  getIt.registerSingleton<FlavourDAO>(FlavourDAOImpl());
  getIt.registerSingleton<IceCreamDAO>(IceCreamDAOImpl());
  getIt.registerSingleton<HolderDAO>(HolderDAOImpl());
  getIt.registerSingleton<CoverageDAO>(CoverageDAOImpl());

  getIt.registerSingleton<ListUserFlavours>(ListUserFlavoursImpl());
  getIt.registerSingleton<IceCreamRepository>(IceCreamRepositoryImpl());
  // getIt.registerSingleton<ServiceSecundaryPort>(StockModelServiceImpl());
  // getIt.registerSingleton<StockModelServiceImpl>(StockModelServiceImpl());
}
