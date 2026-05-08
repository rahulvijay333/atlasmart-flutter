// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerUtil {
  static final ImagePicker _picker = ImagePicker();

  /// Call this ONE method from UI
  static Future<XFile?> pickImage(BuildContext context) async {
    return await showModalBottomSheet<XFile?>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () async {
                  if (context.mounted) {
                    Navigator.pop(context, await _pickFromCamera());
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  if (context.mounted) {
                    Navigator.pop(context, await _pickFromGallery());
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<XFile?> _pickFromGallery() async {
    // Permission handling only for mobile
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
      final status = await Permission.photos.request();
      if (!status.isGranted) return null;
    }

    final XFile? file = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    return file;
  }

  static Future<XFile?> _pickFromCamera() async {
    // Permission handling only for mobile
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
      final status = await Permission.camera.request();
      if (!status.isGranted) return null;
    }

    final XFile? file = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    return file;
  }
}
