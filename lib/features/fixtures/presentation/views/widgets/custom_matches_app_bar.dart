import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/icons/icon_broken.dart';
import '../../view_model/fixtures_cubit/fixtures_cubit.dart';
import '../picked_date_fixtures_view.dart';

class CustomMatchesAppBar extends StatefulWidget {
  const CustomMatchesAppBar({super.key});

  @override
  State<CustomMatchesAppBar> createState() => _CustomMatchesAppBarState();
}

class _CustomMatchesAppBarState extends State<CustomMatchesAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FixturesCubit, FixturesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          children: [
            Text(
              'LiveScore',
              style: TextStyle(
                color: TAppColors.kWhite,
                fontWeight: FontWeight.w500,
                fontSize: 26.0.sp,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                DateTime selectedDate = DateTime.now();
                String todayDate = '';
                String pickedDate = '';
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(
                    selectedDate.year,
                    selectedDate.month - 2,
                    selectedDate.day,
                  ),
                  lastDate: DateTime(
                    selectedDate.year,
                    selectedDate.month + 1,
                    selectedDate.day,
                  ),
                  builder: (context, child) => Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme.dark(
                        primary: TAppColors.kBlue,
                        onPrimary: TAppColors.kWhite,
                        onSurface: TAppColors.kGrey1,
                        surface: TAppColors.kBlack3,
                      ),
                    ),
                    child: child!,
                  ),
                );
                if (picked != null) {
                  todayDate = DateFormat('yyyy-MM-dd').format(selectedDate);
                  pickedDate = DateFormat('yyyy-MM-dd').format(picked);
                  if (todayDate != pickedDate) {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PickedDateFixturesView(
                            pickedDate: pickedDate,
                          ),
                        ),
                      );
                    });
                  }
                }
              },
              child: Text(
                String.fromCharCode(IconBroken.Calendar.codePoint),
                style: TextStyle(
                  inherit: false,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: IconBroken.Calendar.fontFamily,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
