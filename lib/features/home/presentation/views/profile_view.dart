import 'package:flutter/material.dart';
import 'package:gp_app/features/home/presentation/views/widgets/incognito_view.dart';
import 'package:gp_app/features/home/presentation/views/widgets/user_profile_view.dart';

import '../../../../core/utils/cache_helper.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final condition = CacheHelper.getData(key: 'uId');
  @override
  Widget build(BuildContext context) {
    return condition != null ? const UserProfileView() : const IncognitoView();
  }
}
