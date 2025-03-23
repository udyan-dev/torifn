import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:torfin/core/theme/app_color.dart';
import 'package:torfin/core/theme/app_theme.dart';
import 'package:torfin/core/utils/app_constant.dart';
import 'package:torfin/src/data/source/local/app_storage.dart';
import 'package:torfin/src/domain/repository/snowfl_repository.dart';
import 'package:torfin/src/domain/usecase/search_torrent_use_case.dart';
import 'package:torfin/src/presentation/pages/favorite/bloc/favorite_cubit.dart';
import 'package:torfin/src/presentation/widgets/connectivity/bloc/connectivity_cubit.dart';

import 'data/repository/snowfl_repository_imp.dart';
import 'data/repository/storage_repository_imp.dart';
import 'data/source/remote/dio_service.dart';
import 'data/source/remote/token_service.dart';
import 'domain/repository/storage_repository.dart';
import 'domain/usecase/get_favorite_use_case.dart';
import 'domain/usecase/get_token_use_case.dart';
import 'domain/usecase/get_trending_use_case.dart';
import 'domain/usecase/remove_torrent_use_case.dart';
import 'domain/usecase/save_torrent_use_case.dart';
import 'presentation/pages/download/bloc/download_cubit.dart';
import 'presentation/pages/home/bloc/home_cubit.dart';
import 'presentation/pages/search/bloc/search_cubit.dart';
import 'presentation/pages/splash/bloc/splash_cubit.dart';
import 'presentation/pages/trending/bloc/trending_cubit.dart';

final di = GetIt.instance;

Future<void> setup() async {
  di.registerSingleton<AppColor>(AppColor());
  ThemeColor.initialize(di());
  final appStorage = await AppStorage.getInstance();
  di.registerSingleton<AppStorage>(appStorage);
  di.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: AppConstant.baseUrl,
        connectTimeout: AppConstant.timeoutDuration,
        receiveTimeout: AppConstant.timeoutDuration,
        sendTimeout: AppConstant.timeoutDuration,
      ),
    ),
  );
  di.registerSingleton<CancelToken>(CancelToken());
  di.registerSingleton<DioService>(DioService(dioClient: di()));
  di.registerSingleton<TokenService>(TokenService(dioService: di()));

  ///REPOSITORIES
  di.registerSingleton<StorageRepository>(
    StorageRepositoryImp(appStorage: di()),
  );
  di.registerSingleton<SnowflRepository>(SnowflRepositoryImp(dioService: di()));

  ///USE_CASE
  di.registerSingleton<GetTokenUseCase>(
    GetTokenUseCase(storageRepository: di(), tokenService: di()),
  );
  di.registerSingleton<GetTrendingUseCase>(
    GetTrendingUseCase(storageRepository: di(), snowflRepository: di()),
  );
  di.registerSingleton<SearchTorrentUseCase>(
    SearchTorrentUseCase(storageRepository: di(), snowflRepository: di()),
  );
  di.registerSingleton<GetFavoriteUseCase>(
    GetFavoriteUseCase(storageRepository: di()),
  );
  di.registerSingleton<SaveTorrentUseCase>(
    SaveTorrentUseCase(storageRepository: di()),
  );
  di.registerSingleton<RemoveTorrentUseCase>(
    RemoveTorrentUseCase(storageRepository: di()),
  );

  ///CUBIT
  di.registerSingleton<ConnectivityCubit>(ConnectivityCubit());
  di.registerSingleton<HomeCubit>(
    HomeCubit(
      appStorage: di(),
      getFavoriteUseCase: di(),
      saveTorrentUseCase: di(),
      removeTorrentUseCase: di(),
    ),
  );
  di.registerSingleton<SplashCubit>(
    SplashCubit(getTokenUseCase: di(), cancelToken: di()),
  );
  di.registerSingleton<TrendingCubit>(TrendingCubit(getTrendingUseCase: di()));
  di.registerSingleton<SearchCubit>(SearchCubit(searchTorrentUseCase: di()));
  di.registerSingleton<FavoriteCubit>(
    FavoriteCubit(
      getFavoriteUseCase: di(),
      saveTorrentUseCase: di(),
      removeTorrentUseCase: di(),
    ),
  );
  di.registerSingleton<DownloadCubit>(DownloadCubit(appStorage: di()));
}
