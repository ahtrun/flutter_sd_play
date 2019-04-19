import 'package:flutter/material.dart';

class Top extends StatefulWidget implements PreferredSizeWidget {
  Top({@required this.child,this.color}) : assert(child != null);
  final Widget child;
  Color color;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MAppBarState();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(50.0);


}
class MAppBarState extends State<Top> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Column(children: <Widget>[
      Container(height: statusBarHeight,color: widget.color==null?Color(0xffffffff):widget.color,),
      widget.child
    ],);
  }
}