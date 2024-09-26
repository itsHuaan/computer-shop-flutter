import 'package:flutter/material.dart';
import 'package:login_example/components/my_button.dart';
import 'package:login_example/theme/screen_size.dart';
import 'package:provider/provider.dart';

import '../providers/login_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: ScreenSize.widthPercent(context, 50),
            child: MyButton(
              borderRadius: BorderRadius.circular(15.0),
              textStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              backgroundColor: const Color.fromARGB(128, 0, 128, 255),
              text: 'Log out',
              onPressed: () {
                loginProvider.logOut(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
