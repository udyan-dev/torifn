import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:torfin/core/utils/app_constant.dart';
import 'package:torfin/core/utils/app_extension.dart';
import 'package:torfin/src/presentation/pages/download/bloc/download_cubit.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/utils/app_utility.dart';
import '../../../../gen/assets.gen.dart';
import '../../../injection.dart';
import '../../widgets/bottom_navigation_bar.dart';
import '../download/download_page.dart';
import '../favorite/bloc/favorite_cubit.dart';
import '../favorite/favorite_page.dart';
import '../search/bloc/search_cubit.dart';
import '../search/search_page.dart';
import '../settings/settings_page.dart';
import '../trending/bloc/trending_cubit.dart';
import '../trending/trending_page.dart';
import 'bloc/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<TrendingCubit>()),
        BlocProvider(create: (context) => di<SearchCubit>()),
        BlocProvider(create: (context) => di<FavoriteCubit>()),
        BlocProvider(create: (context) => di<DownloadCubit>()),
      ],
      child: BlocListener<HomeCubit, HomeState>(
        listenWhen:
            (_, state) =>
                state.status == HomeStateEnum.permissionDenied ||
                state.status == HomeStateEnum.permissionGranted,
        listener: (context, state) {
          if (state.status == HomeStateEnum.permissionGranted) {
            showSnackBar(
              context,
              "Permission Granted !",
              SvgPicture.asset(
                AppAsset.svg.icSuccess.path,
                colorFilter: context.themeColors.supportSuccess.colorFilter,
              ),
              context.isDark
                  ? di<AppColor>().gray[80]
                  : di<AppColor>().green[10],
              context.themeColors.supportSuccess,
            );
          } else if (state.status == HomeStateEnum.permissionDenied) {
            showSnackBar(
              context,
              "Permission Denied !",
              SvgPicture.asset(
                AppAsset.svg.icBan.path,
                colorFilter: context.themeColors.supportError.colorFilter,
              ),
              context.isDark ? di<AppColor>().gray[80] : di<AppColor>().red[10],
              context.themeColors.supportError,
            );
          }
        },
        child: Scaffold(
          backgroundColor: context.themeColors.background,
          body: BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (_, state) => state.status == HomeStateEnum.indexChanged,
            builder: (context, state) {
              return _buildPage(state.index);
            },
          ),
          bottomNavigationBar: const BottomNavigationBarWidget(
            key: ValueKey("BottomNavigationBar"),
          ),
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const TrendingPage(key: ValueKey("TrendingPage"));
      case 1:
        return const SearchPage(key: ValueKey("SearchPage"));
      case 2:
        return const FavoritePage(key: ValueKey("FavoritePage"));
      case 3:
        return const DownloadPage(key: ValueKey("DownloadPage"));
      case 4:
        return const SettingsPage(key: ValueKey("SettingsPage"));
      default:
        return AppConstant.empty;
    }
  }
}
