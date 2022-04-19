import 'package:flutter/material.dart';
import '../../../../app_export.dart';

class StartUpLoadingPage extends StatefulWidget {
  final VoidCallback onLoadingResult;
  const StartUpLoadingPage({Key? key, required this.onLoadingResult,}) : super(key: key);

  @override
  State<StartUpLoadingPage> createState() => _StartUpLoadingPageState();
}

class _StartUpLoadingPageState extends State<StartUpLoadingPage> {

  String _loadingText = 'Loading...';

  @override
  void initState() {
    super.initState();

    _loading();
  }

  void _loading()async{
    setState(() {
      _loadingText = 'Load Theme';
    });
    await CustomMaterialApp.of(context)!.loadTheme();
    setState(() {
      _loadingText = 'Check Auth';
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _loadingText = 'Finished';
    });
    widget.onLoadingResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(_loadingText),
        ),
      ),
    );
  }
}
