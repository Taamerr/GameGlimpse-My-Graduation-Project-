import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/home/data/repos/home_repo/home_repo_impl.dart';
import 'features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'core/utils/cache_helper.dart';

import 'core/constants/colors.dart';
import 'core/themes/dark_theme.dart';
import 'core/themes/light_theme.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/service_locator.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ServiceLocator.setup();
  CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: TAppColors.kScaffoldColor,
  ));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        ServiceLocator.getIt.get<HomeRepoImpl>(),
      )
        ..getDate()
        ..getAllMatches(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        themeMode: ThemeMode.system,
        theme: TLightTheme.lightTheme,
        darkTheme: TDarkTheme.darkTheme,
      ),
    );
  }
}
