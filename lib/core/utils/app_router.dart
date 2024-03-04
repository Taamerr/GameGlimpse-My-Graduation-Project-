import 'package:go_router/go_router.dart';
import '../../features/home/presentation/views/widgets/edit_profile.dart';

import '../../features/home/presentation/views/home_layout.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kOnBoarding = '/onBoardingView';
  static const kSplashView = '/';
  static const kHomeLayout = '/homeLayout';
  static const kSearchView = '/searchView';
  static const kEditProfile = '/editProfile';

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
    ],
  );
}
