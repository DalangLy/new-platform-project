import 'package:flutter/material.dart';

import 'end_drawer/end_drawer_page_route.dart';

class MainEndDrawer extends StatelessWidget {
  const MainEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, right: 5.0),
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Drawer(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: const EndDrawerPageRoute(),
            ),
          ),
        ),
      ),
    );
  }
}