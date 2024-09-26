import 'package:flutter/material.dart';
import 'package:login_example/components/my_app_bar.dart';
import 'package:login_example/components/my_circle_icon_button.dart';
import 'package:login_example/components/my_circular_progress_indicator.dart';
import 'package:login_example/services/storage_service.dart';
import 'package:provider/provider.dart';

class CategoryManagement extends StatefulWidget {
  const CategoryManagement({super.key});

  @override
  State<CategoryManagement> createState() => _CategoryManagementState();
}

class _CategoryManagementState extends State<CategoryManagement> {
  Future<void> fetchImages() async {
    await Provider.of<StorageService>(context, listen: false).fetchImages();
  }

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StorageService>(
      builder: (context, value, child) {
        final List<String> imageUrls = value.imageUrls;
        return Scaffold(
          appBar: MyAppBar(title: 'Categories'),
          floatingActionButton: FloatingActionButton(
            onPressed: () => value.uploadImages(),
            child: const Icon(Icons.upload_rounded),
          ),
          body: ListView.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              final String imageUrl = imageUrls[index];
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  children: [
                    Image.network(
                      imageUrl,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: MyCircularProgressIndicator(
                                strokeWidth: 5,
                                value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                              ),
                            ),
                          );
                        } else {
                          return child;
                        }
                      },
                    ),
                    Positioned(
                      top: 10.0,
                      right: 10.0,
                      child: MyCircleIconButton(
                        icon: Icons.delete_rounded,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        onPressed: () => value.deleteImages(imageUrl),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
