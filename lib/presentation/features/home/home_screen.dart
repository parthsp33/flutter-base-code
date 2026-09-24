import 'package:base_project/presentation/base/base_widget.dart';
import 'package:base_project/presentation/custom/widgets/custom_app_bar.dart';
import 'package:base_project/presentation/custom/widgets/custom_button.dart';
import 'package:base_project/presentation/features/home/cubit/home_cubit.dart';

import '../../../util/core_export.dart';

class HomeScreen extends BaseWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<HomeCubit>();
          return Scaffold(
            appBar: CustomAppBar(title: Strings.home(), showBack: false),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  twoColorTitle(title: Strings.welcome(), coloredTitle: cubit.userName),
                  12.h.verticalSpace,
                  Text(Strings.homeMessage(), style: dmSans400()),
                  const Spacer(),
                  CustomButton(text: Strings.logout(), onTap: cubit.onTapLogout),
                ],
              ).withAllPadding(16.w),
            ),
          );
        },
      ),
    );
  }
}
