// ignore_for_file: file_names

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FileManagementController extends GetxController {
  Rx<PlatformFile> file = PlatformFile(name: "Null", size: 0).obs;
}
