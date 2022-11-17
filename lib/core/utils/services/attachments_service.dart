import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';

class AttachmentsService {
  final ImagePicker _picker;

  AttachmentsService(this._picker);

   Future<XFile?>? getGalleryImage() async {
  return await _picker.pickImage(
      source: ImageSource.gallery,
    );
  }

  Future<XFile?>? getCameraImage() async {
    return await _picker.pickImage(
      source: ImageSource.camera,
    );
  }

  Future<List<XFile>?> getMultiImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    return images;
  }

}

