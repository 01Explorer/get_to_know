import 'package:flutter/material.dart';

class ExpandableAppBar extends StatelessWidget {
  const ExpandableAppBar({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.widget,
    this.actions,
  }) : super(key: key);

  final List<Widget>? actions;
  final String title;
  final String imagePath;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              actions: actions,
              expandedHeight: 240,
              centerTitle: true,
              title: Text(title),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        imagePath,
                      ),
                      fit: BoxFit.cover,
                      opacity: 0.3),
                ),
              ),
              floating: true,
              pinned: true,
            )
          ];
        },
        body: widget);
  }
}
