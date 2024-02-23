import 'package:flutter/material.dart';

class KeepAliveWrapper extends StatefulWidget {
  final Widget child;
  final bool keepAlive;

  const KeepAliveWrapper({Key? key, required this.child, this.keepAlive = true})
      : super(key: key);

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}