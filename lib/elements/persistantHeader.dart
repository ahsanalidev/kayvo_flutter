import 'package:flutter/material.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(
    this.newAppbar,
  );
  AppBar newAppbar;

  @override
  double get minExtent => newAppbar.preferredSize.height;
  @override
  double get maxExtent => newAppbar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return newAppbar;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
