import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/standings/data/repos/standings_repo_impl.dart';
import '../../features/fixtures/data/repos/fixtures_repo/fixtures_repo_impl.dart';
import '../../features/profile/data/repos/profile_repo/profile_repo_impl.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/profile/data/repos/edit_profile_repo/edit_profile_repo_impl.dart';
import '../../features/fixtures/data/repos/match_details_repo/match_details_repo_impl.dart';
import '../../features/summary/data/repos/video_summary_repo/video_summ_repo_impl.dart';
import 'api_services.dart';

abstract class ServiceLocator {
  static final getIt = GetIt.instance;
  static void setup() {
    getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
    getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
    getIt.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl());
    getIt.registerSingleton<FixturesRepoImpl>(
        FixturesRepoImpl(apiService: getIt.get<ApiService>()));
    getIt.registerSingleton<StandingsRepoImpl>(
        StandingsRepoImpl(apiService: getIt.get<ApiService>()));
    getIt.registerSingleton<VideoSummaryRepoImpl>(
        VideoSummaryRepoImpl(apiService: getIt.get<ApiService>()));
    getIt.registerSingleton<MatchDetailsRepoImpl>(
        MatchDetailsRepoImpl(apiService: getIt.get<ApiService>()));
    getIt.registerSingleton<EditProfileRepoImpl>(EditProfileRepoImpl());
  }
}
