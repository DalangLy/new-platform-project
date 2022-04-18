import 'package:flutter/material.dart';

import '../../../../root_material_app.dart';

class StartUpLoadingPage extends StatefulWidget {
  final VoidCallback onLoadingResult;
  const StartUpLoadingPage({Key? key, required this.onLoadingResult,}) : super(key: key);

  @override
  State<StartUpLoadingPage> createState() => _StartUpLoadingPageState();
}

class _StartUpLoadingPageState extends State<StartUpLoadingPage> {
  @override
  void initState() {
    super.initState();

    _loading();
  }

  void _loading()async{
    await CustomMaterial.of(context)!.loadTheme();
    widget.onLoadingResult();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Loading Screen'),
        ),
      ),
    );
  }
}
