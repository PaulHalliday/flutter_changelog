library flutter_changelog;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

/// Opens up a [ChangeLogScreen]
class ChangeLogScreen extends StatelessWidget {
  final String title;
  final String markdownData;
  final ScrollController scrollController = ScrollController();

  ChangeLogScreen({
    @required this.title,
    @required this.markdownData,
  })  : assert(title != null),
        assert(markdownData != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Markdown(
          controller: scrollController,
          data: markdownData,
        ),
      ),
    );
  }
}
