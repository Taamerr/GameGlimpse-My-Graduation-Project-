import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';

import 'widgets/profile/incognito_view.dart';
import 'widgets/profile/user_profile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Constants.userModel != null
        ? const UserProfileView()
        : const IncognitoView();
  }
}
