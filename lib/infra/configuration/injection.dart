import 'package:get_it/get_it.dart';
import 'package:ice_app/domain/ports/list_flavours.dart';
import 'package:ice_app/infra/dao/impl/flavour_dao_impl.dart';
import 'package:ice_app/infra/dao/interfaces/flavour_dao.dart';
import 'package:ice_app/infra/dao/services/list_user_flavours_impl.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  /// DAO
  getIt.registerSingleton<FlavourDAO>(FlavourDAOImpl());

  getIt.registerSingleton<ListUserFlavours>(ListUserFlavoursImpl());
  // getIt.registerSingleton<ServiceSecundaryPort>(StockModelServiceImpl());
  // getIt.registerSingleton<StockModelServiceImpl>(StockModelServiceImpl());
}
