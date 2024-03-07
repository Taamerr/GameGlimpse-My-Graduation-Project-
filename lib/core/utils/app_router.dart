import 'package:go_router/go_router.dart';
import '../../features/home/data/models/fixtures_model/match_data.dart';
import '../../features/home/data/models/league_standing_model/league_standing_model.dart';
import '../../features/home/presentation/views/match_details_view.dart';
import '../../features/home/presentation/views/widgets/league_full_standing_view.dart';

import '../../features/home/presentation/views/home_layout.dart';
import '../../features/home/presentation/views/widgets/edit_profile.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kOnBoarding = '/onBoardingView';
  static const kSplashView = '/';
  static const kHomeLayout = '/homeLayout';
  static const kSearchView = '/searchView';
  static const kEditProfile = '/editProfile';
  static const kMatchDetails = '/matchDetails';
  static const kLeagueFullStanding = '/leagueFullStanding';

  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kHomeLayout,
        builder: (context, state) => const HomeLayout(),
      ),
      GoRoute(
        path: kEditProfile,
        builder: (context, state) => const EditProfile(),
      ),
      GoRoute(
        path: kMatchDetails,
        builder: (context, state) {
          MatchData matchData = state.extra as MatchData;
          return MatchDetailsView(
            matchData: matchData,
          );
        },
      ),
      GoRoute(
        path: kLeagueFullStanding,
        builder: (context, state) {
          LeagueStandingModel leagueStandingModel =
              state.extra as LeagueStandingModel;
          return LeagueFullStandingView(
            model: leagueStandingModel,
          );
        },
      ),
    ],
  );
}
