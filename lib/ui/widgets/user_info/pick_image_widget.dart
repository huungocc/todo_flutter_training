import 'package:flutter/material.dart';
import 'package:todo_flutter_training/ui/widgets/setting/setting_button.dart';

class PickImageWidget extends StatelessWidget {
  final VoidCallback onTakePhoto;
  final VoidCallback onPickGallery;

  const PickImageWidget({
    required this.onTakePhoto,
    required this.onPickGallery,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SettingButton(
              icon: Icons.camera_alt,
              title: 'Chụp ảnh',
              onTap: () {
                Navigator.pop(context);
                onTakePhoto();
              },
            ),
            SettingButton(
              icon: Icons.photo_library,
              title: 'Chọn từ thư viện',
              onTap: () {
                Navigator.pop(context);
                onPickGallery();
              },
            ),
          ],
        ),
      ),
    );
  }
}
