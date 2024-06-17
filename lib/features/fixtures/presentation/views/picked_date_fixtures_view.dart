import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/core/utils/service_locator.dart';
import 'package:gp_app/features/fixtures/data/repos/fixtures_repo_impl.dart';
import 'package:gp_app/features/fixtures/presentation/view_model/picked_date_cubit/picked_date_cubit.dart';
import 'package:gp_app/features/fixtures/presentation/views/widgets/picked_date_fixtures_view_body.dart';
import 'package:intl/intl.dart';

class PickedDateFixturesView extends StatelessWidget {
  const PickedDateFixturesView({
    super.key,
    required this.pickedDate,
  });
  final String pickedDate;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PickedDateCubit(
        ServiceLocator.getIt.get<FixturesRepoImpl>(),
      )..getFixuresDatePicked(pickedDate: pickedDate),
      child: Scaffold(
        body: SafeArea(
          child: PickedDateFixturesViewBody(
            date: DateFormat.MMMd().format(DateTime.parse(pickedDate)),
          ),
        ),
      ),
    );
  }
}
