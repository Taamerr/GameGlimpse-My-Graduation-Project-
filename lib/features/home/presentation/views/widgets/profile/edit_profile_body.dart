import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../core/constants/assets.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/icons/icon_broken.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../view_model/edit_profile_cubit/edit_profile_cubit.dart';
import 'edit_profile_app_bar.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<EditProfileCubit, EditProfileState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = EditProfileCubit.get(context);
            var nameController = TextEditingController();
            var bioController = TextEditingController();
            nameController.text = Constants.userModel!.name;
            bioController.text = Constants.userModel!.bio;
            return Column(
              children: [
                const EditProfileAppBar(),
                state is EditProfileUpdateDataLoadingState
                    ? const LinearProgressIndicator(
                        color: TAppColors.kBlue,
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 180,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              image: AssetImage(TAppAssets.profileBackground),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.147,
                            backgroundColor: TAppColors.kScaffoldColor,
                            child: cubit.profileImage == null
                                ? CachedNetworkImage(
                                    width: MediaQuery.of(context).size.width *
                                        0.14 *
                                        2,
                                    height: MediaQuery.of(context).size.width *
                                        0.14 *
                                        2,
                                    imageUrl: Constants.userModel!.image,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  )
                                : Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.14 *
                                        2,
                                    height: MediaQuery.of(context).size.width *
                                        0.14 *
                                        2,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: FileImage(cubit.profileImage!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: TAppColors.kBlack1,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: TAppColors.kBlue,
                              child: IconButton(
                                onPressed: () {
                                  cubit.getProfileImage();
                                },
                                icon: const Icon(
                                  IconBroken.Camera,
                                  color: TAppColors.kWhite,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 45.0,
                ),
                CustomTextFormField(
                  hintText: 'Name',
                  prefixIcon: const Icon(
                    IconBroken.Profile,
                    size: 28,
                  ),
                  controller: nameController,
                  fillColor: TAppColors.kBlack1,
                  textColor: TAppColors.kWhite,
                  onChanged: (String data) {
                    nameController.text = data;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                CustomTextFormField(
                  hintText: 'Bio',
                  controller: bioController,
                  prefixIcon: const Icon(FontAwesomeIcons.addressCard),
                  fillColor: TAppColors.kBlack1,
                  textColor: TAppColors.kWhite,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  minLines: 1,
                  onChanged: (String data) {
                    bioController.text = data;
                  },
                ),
                const SizedBox(
                  height: 35.0,
                ),
                CustomButton(
                  backgroundColor: TAppColors.kBlue,
                  textColor: TAppColors.kWhite,
                  text: 'Update',
                  width: MediaQuery.of(context).size.width,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  height: 48,
                  onPressed: () {
                    String image = cubit.imageUrl == null
                        ? Constants.userModel!.image
                        : cubit.imageUrl!;
                    cubit.updateUserData(
                      image: image,
                      name: nameController.text,
                      bio: bioController.text,
                      uId: Constants.userModel!.uId,
                      email: Constants.userModel!.email,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
