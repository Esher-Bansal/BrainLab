import 'dart:math';
import 'package:brainlab/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

bool _showFrontSide = true;

class Tile extends StatefulWidget {
  const Tile({super.key});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    Widget _buildFlipAnimation() {
      return GestureDetector(
        onDoubleTap: () {},
        onTap: () {
          setState(() {
            _showFrontSide = !_showFrontSide;
          });
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: __transitionBuilder,
          layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
          switchInCurve: Curves.easeInBack,
          switchOutCurve: Curves.easeInBack.flipped,
          child: _showFrontSide ? _buildFront() : _buildRear(),
        ),
      );
    }

    return _buildFlipAnimation();
  }

  Widget __buildLayout({Key? key, String? faceName, Color? backgroundColor}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.0),
        color: backgroundColor,
      ),
      child: Center(
        child: faceName != null
            ? Text(faceName.substring(0, 1), style: AppTheme.tiletext)
            : const SizedBox(),
      ),
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      key: const ValueKey(true),
      backgroundColor: Colors.blue,
    );
  }

  Widget _buildRear() {
    return __buildLayout(
      key: const ValueKey(false),
      backgroundColor: Colors.blue.shade700,
      faceName: "2",
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}
