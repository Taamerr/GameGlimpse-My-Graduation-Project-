import 'package:flutter/material.dart';
import 'widgets/incognito_view.dart';
import 'widgets/user_profile_view.dart';

import '../../../../core/utils/cache_helper.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final condition = CacheHelper.getData(key: 'uId');
  @override
  Widget build(BuildContext context) {
    return condition != null ? const UserProfileView() : const IncognitoView();
  }
}
