import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

//-------------------------------------------------------
//-------------------------------------------------------

// on Hover Card
class OnHoverButton extends StatefulWidget {
  final Widget child;

  const OnHoverButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _OnHoverButtonState createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(1.1);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          transform: transform,
          child: widget.child),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}

//-----------------------------------------------------------
//------------------------------------------------------------

// on Hover Text
class OnHoverText extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const OnHoverText({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  _OnHoverTextState createState() => _OnHoverTextState();
}

class _OnHoverTextState extends State<OnHoverText> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()
      ..translate(8, 0, 0)
      ..scale(1.1);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        curve: Sprung.overDamped,
        duration: Duration(milliseconds: 200),
        transform: transform,
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
