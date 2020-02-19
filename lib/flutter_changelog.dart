library flutter_changelog;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

/// Opens up a [ChangeLogScreen]
class ChangeLogScreen extends StatelessWidget {
  final Widget title;
  final String markdownData;
  final String markdownFilePath;

  final ScrollController scrollController = ScrollController();

  ChangeLogScreen({
    @required this.title,
    this.markdownData,
    this.markdownFilePath,
  }) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: SafeArea(
          child: markdownFilePath != null
              ? FutureBuilder(
                  future: rootBundle.loadString(markdownFilePath),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(
                        controller: scrollController,
                        data: snapshot.data,
                      );
                    }

                    return Center(child: CircularProgressIndicator());
                  },
                )
              : Markdown(
                  controller: scrollController,
                  data: markdownData,
                )),
    );
  }
}
