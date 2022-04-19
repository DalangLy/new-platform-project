import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DHomeInnerScaffold extends StatefulWidget {
  final List<DBreadCrumb> breadCrumbs;
  final Widget body;
  final VoidCallback? onAddTapped;

  const DHomeInnerScaffold({
    Key? key,
    required this.breadCrumbs,
    required this.body,
    this.onAddTapped,
  }) : super(key: key);

  static _DHomeInnerScaffoldState? of(BuildContext context){
    return context.findAncestorStateOfType<_DHomeInnerScaffoldState>();
  }

  @override
  State<DHomeInnerScaffold> createState() => _DHomeInnerScaffoldState();
}

class _DHomeInnerScaffoldState extends State<DHomeInnerScaffold> {
  late final List<Widget> _breadCrumbWidgets = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _buildBreadCrumbs();
    });
  }

  void _buildBreadCrumbs() {
    for (var element in widget.breadCrumbs) {
      final Widget breadCrumbButton = TextButton(
        onPressed: element.onTapped,
        child: Text(
          element.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:
          TextStyle(color: element.onTapped == null ? Colors.grey : Colors.black,),
        ),
      );
      _breadCrumbWidgets.add(breadCrumbButton);
      final bool isLast = widget.breadCrumbs.indexOf(element) ==
          (widget.breadCrumbs.length - 1);
      if (!isLast) {
        const Widget separator = Text(
          '/',
          style: TextStyle(color: Colors.black,),
        );
        _breadCrumbWidgets.add(separator);
      }
    }

    //refresh ui
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leadingWidth: 800,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                AutoRouter.of(context).pop();
              },
              icon: const Icon(Icons.chevron_left),
            ),
            ..._breadCrumbWidgets,
          ],
        ),
        actions: [
          widget.onAddTapped == null ? const SizedBox() :  IconButton(onPressed: widget.onAddTapped, icon: const Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
        child: widget.body,
      ),
    );
  }
}

class DBreadCrumb {
  final String title;
  final VoidCallback? onTapped;

  const DBreadCrumb({
    required this.title,
    this.onTapped,
  });
}