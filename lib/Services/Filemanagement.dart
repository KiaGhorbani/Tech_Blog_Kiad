// ignore_for_file: file_names

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:techblog/Controller/FileManagement_Controller.dart';

FileManagementController _fileManagementController =
    Get.put(FileManagementController());

Future pickFile() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);

  _fileManagementController.file.value = result!.files.first;
}
