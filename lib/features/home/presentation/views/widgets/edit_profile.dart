import 'package:flutter/material.dart';
import 'package:gp_app/features/home/presentation/views/widgets/edit_profile_body.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: EditProfileBody(),
      ),
    );
  }
}
