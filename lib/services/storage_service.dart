import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class StorageService extends ChangeNotifier {
  final firebaseStorage = FirebaseStorage.instance;
  List<String> _imageUrls = [];
  bool _isLoading = false;
  bool _isUploading = false;

  List<String> get imageUrls => _imageUrls;
  bool get isLoading => _isLoading;
  bool get isUploading => _isUploading;

  String extractPath(String url) => Uri.decodeComponent(Uri.parse(url).pathSegments.last);

  Future<void> fetchImages() async {
    _isLoading = true;
    final ListResult result = await firebaseStorage.ref('uploaded_images/').listAll();
    final urls = await Future.wait(
      result.items.map(
        (ref) => ref.getDownloadURL(),
      ),
    );

    _imageUrls = urls;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteImages(String imageUrl) async {
    try {
      _imageUrls.remove(imageUrl);
      final String path = extractPath(imageUrl);
      await firebaseStorage.ref(path).delete();
    } catch (e) {
      print('Error deleting image: $e');
    }
    notifyListeners();
  }

  Future<void> uploadImages() async {
    _isUploading = true;
    notifyListeners();
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    File file = File(image.path);
    try {
      String filePath = 'uploaded_images/${DateFormat('EEE_MMMddyyyy_HHmmss').format(DateTime.now())}.png';
      await firebaseStorage.ref(filePath).putFile(file);
      String downloadUrl = await firebaseStorage.ref(filePath).getDownloadURL();
      _imageUrls.add(downloadUrl);
      notifyListeners();
    } catch (e) {
      print('Error uploading image: $e');
    } finally {
      _isUploading = false;
      notifyListeners();
    }
  }
}
