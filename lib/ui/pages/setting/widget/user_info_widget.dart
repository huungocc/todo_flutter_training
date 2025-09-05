import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
import 'package:todo_flutter_training/global_blocs/user_info/user_info_cubit.dart';
import 'package:todo_flutter_training/global_blocs/user_info/user_info_state.dart';
import 'package:todo_flutter_training/ui/widgets/base_cached_image.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/setting/default_avatar_widget.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<UserInfoCubit, UserInfoState>(
        buildWhen: (prev, curr) => prev.userInfo != curr.userInfo,
        builder: (context, state) {
          return Column(
            spacing: 20,
            children: [
              BaseCachedImage(
                imageUrl: state.userInfo.avatarUrl ?? '',
                width: AppDimens.avatarSize,
                height: AppDimens.avatarSize,
                borderRadius: BorderRadius.circular(60),
                errorWidget: const DefaultAvatarWidget(),
              ),
              BaseTextLabel(
                state.userInfo.userName,
                style: AppTextStyle.blackS18W400,
              ),
            ],
          );
        },
      ),
    );
  }
}
