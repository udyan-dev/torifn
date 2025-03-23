import 'package:dio/dio.dart';
import 'package:torfin/core/helper/base_repository.dart';
import 'package:torfin/core/helper/data_state.dart';
import 'package:torfin/core/utils/app_routes.dart';
import 'package:torfin/src/data/model/request/search/search_req.dart';
import 'package:torfin/src/data/model/request/trending/trending_req.dart';
import 'package:torfin/src/data/model/response/torrent/torrent_res.dart';
import 'package:torfin/src/domain/repository/snowfl_repository.dart';

import '../../../core/helper/app_exception.dart';
import '../source/remote/dio_service.dart';

class SnowflRepositoryImp extends BaseRepository implements SnowflRepository {
  final DioService dioService;

  SnowflRepositoryImp({required this.dioService});

  @override
  Future<DataState<List<TorrentRes>>> getTrending({
    required TrendingReq trendingReq,
    required CancelToken cancelToken,
  }) async {
    try {
      return await getStateOf(
        request:
            () async => await dioService.getCollection<TorrentRes>(
              endpoint: AppRoutes.getTrending(trendingReq: trendingReq),
              queryParams: getQueryParams,
              cancelToken: cancelToken,
            ),
      );
    } on AppException catch (e) {
      return DataFailed(AppException(type: e.type, message: e.message));
    }
  }

  @override
  Future<DataState<List<TorrentRes>>> searchTorrent({
    required SearchReq searchReq,
    required CancelToken cancelToken,
  }) async {
    try {
      return await getStateOf(
        request:
            () async => await dioService.getCollection<TorrentRes>(
              endpoint: AppRoutes.search(searchReq: searchReq),
              queryParams: getQueryParams,
              cancelToken: cancelToken,
            ),
      );
    } on AppException catch (e) {
      return DataFailed(AppException(type: e.type, message: e.message));
    }
  }
}
