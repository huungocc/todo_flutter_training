import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/ui/pages/user_info/user_info_cubit.dart';
import 'package:todo_flutter_training/ui/pages/user_info/user_info_state.dart';
import 'package:todo_flutter_training/ui/widgets/user_info/pick_image_widget.dart';
import 'package:todo_flutter_training/ui/widgets/base_local_image.dart';
import 'package:todo_flutter_training/ui/widgets/base_cached_image.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_input.dart';
import 'package:todo_flutter_training/ui/widgets/setting/default_avatar_widget.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';

class UserInfoBody extends StatefulWidget {
  const UserInfoBody({super.key});

  @override
  State<UserInfoBody> createState() => _UserInfoBodyState();
}

class _UserInfoBodyState extends State<UserInfoBody> {
  final ImagePicker _picker = ImagePicker();

  void _pickAvatar(XFile avatarFile) {
    context.read<UserInfoCubit>().pickAvatarFromFile(avatarFile);
  }

  Future<void> _onTakePhoto() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (image != null) {
        _pickAvatar(image);
      }
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> _onPickGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        _pickAvatar(image);
      }
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserInfoCubit>();
    return Column(
      spacing: 30,
      children: [
        const SizedBox.shrink(),

        _buildAvatar(),

        /// TextField Info
        BlocBuilder<UserInfoCubit, UserInfoState>(
          buildWhen: (prev, curr) => curr.isEditing != prev.isEditing,
          builder: (context, state) {
            return BaseTextInput(
              textController: cubit.userNameController,
              title: S.of(context).full_name,
              readOnly: !state.isEditing,
            );
          },
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      buildWhen: (prev, curr) =>
          curr.avatarFile != prev.avatarFile ||
          curr.isEditing != prev.isEditing,
      builder: (context, state) {
        if (state.avatarFile != null) {
          return BaseLocalImage(
            filePath: state.avatarFile!.path,
            width: AppDimens.avatarSize,
            height: AppDimens.avatarSize,
            borderRadius: BorderRadius.circular(60),
            onEditTap: () => _showBottomSheet(),
            showEditButton: state.isEditing,
          );
        }
        return BaseCachedImage(
          imageUrl: state.userInfo.avatarUrl ?? '',
          width: AppDimens.avatarSize,
          height: AppDimens.avatarSize,
          borderRadius: BorderRadius.circular(60),
          errorWidget: const DefaultAvatarWidget(),
          onEditTap: () => _showBottomSheet(),
          showEditButton: state.isEditing,
        );
      },
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return PickImageWidget(
          onTakePhoto: _onTakePhoto,
          onPickGallery: _onPickGallery,
        );
      },
    );
  }
}
