import 'package:flutter/material.dart';
import 'package:login_example/components/my_app_bar.dart';
import 'package:login_example/components/my_button.dart';
import 'package:login_example/components/my_circle_icon_button.dart';
import 'package:login_example/components/my_text_field.dart';
import 'package:login_example/theme/screen_size.dart';

class CategoryManagement extends StatelessWidget {
  const CategoryManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Categories',
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, // Allow the modal to grow based on content
                builder: (BuildContext context) {
                  return Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15.0),
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Add new category',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                MyCircleIconButton(
                                  icon: Icons.close_rounded,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
                            child: MyTextField(
                              maxLines: 1,
                              enabledBorderColor: Theme.of(context).colorScheme.secondary,
                              focusedBorderColor: Theme.of(context).colorScheme.tertiary,
                              labelText: 'Category name',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
                            child: MyTextField(
                              maxLines: 10,
                              enabledBorderColor: Theme.of(context).colorScheme.secondary,
                              focusedBorderColor: Theme.of(context).colorScheme.tertiary,
                              labelText: 'Category Description',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(20),
                                backgroundColor: Theme.of(context).colorScheme.secondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.upload_rounded,
                                    color: Theme.of(context).colorScheme.onSecondary,
                                  ),
                                  Text(
                                    'Upload a photo',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.onSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
                            child: MyButton(
                              text: 'Save',
                              backgroundColor: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(10.0),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
    );
  }
}
