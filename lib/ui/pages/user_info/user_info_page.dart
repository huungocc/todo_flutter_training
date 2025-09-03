import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/ui/widgets/base_cached_image.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_input.dart';
import 'package:todo_flutter_training/ui/widgets/setting/default_avatar_widget.dart';

class ChangeInfoPage extends StatelessWidget {
  const ChangeInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ChangeInfoBody();
  }
}

class _ChangeInfoBody extends StatefulWidget {
  const _ChangeInfoBody();

  @override
  State<_ChangeInfoBody> createState() => _ChangeInfoBodyState();
}

class _ChangeInfoBodyState extends State<_ChangeInfoBody> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: S.of(context).change_info,
      iconBackColor: AppColors.textWhite,
      colorAppBar: AppColors.todoPurple,
      isLightStatusBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 30,
          children: [
            const SizedBox.shrink(),
            Stack(
              alignment: Alignment.center,
              children: [
                // Avatar
                BaseCachedImage(
                  imageUrl:
                  'https://cdn2.tuoitre.vn/zoom/700_700/2019/9/26/joker-2019-15694749399581924786754-crop-1569475051439355050961.jpg',
                  width: AppDimens.avatarSize,
                  height: AppDimens.avatarSize,
                  borderRadius: BorderRadius.circular(60),
                  errorWidget: DefaultAvatarWidget(),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      width: AppDimens.iconSizeNormal,
                      height: AppDimens.iconSizeNormal,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.todoPurple,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 3, color: AppColors.textWhite)
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: AppColors.textWhite,
                        size: AppDimens.iconSizeSmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            BaseTextInput(
              title: S.of(context).full_name,
            ),
          ]
        )
      ),
      // bottomBar: BottomAppBar(
      //   color: Colors.transparent,
      //   child: _buildConfirmButton(cubit),
      // ),
    );
  }

  // Widget _buildConfirmButton(ChangePasswordCubit cubit) {
  //   return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
  //     listenWhen: (prev, curr) =>
  //     curr.changePasswordLoadStatus != prev.changePasswordLoadStatus,
  //     listener: (context, state) {
  //       if (state.changePasswordLoadStatus.isSuccess) {
  //         _backToSetting();
  //       }
  //     },
  //     buildWhen: (prev, curr) =>
  //     curr.changePasswordLoadStatus != prev.changePasswordLoadStatus,
  //     builder: (context, state) {
  //       return BaseButton(
  //         backgroundColor: AppColors.todoPurple,
  //         onTap: state.changePasswordLoadStatus.isLoading
  //             ? null
  //             : () {
  //           cubit.changePassword();
  //         },
  //         child: state.changePasswordLoadStatus.isLoading
  //             ? BaseLoading(
  //           size: AppDimens.iconSizeNormal,
  //           backgroundColor: AppColors.textBlack,
  //           valueColor: AppColors.textWhite,
  //         )
  //             : BaseTextLabel(
  //           S.of(context).confirm,
  //           style: AppTextStyle.whiteS16W500,
  //           textAlign: TextAlign.center,
  //         ),
  //       );
  //     },
  //   );
  // }
}
