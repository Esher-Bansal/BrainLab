import 'dart:math';

import 'package:brainlab/game_widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../theme/app_theme.dart';

bool _showFrontSide = true;

class GridTiles extends StatefulWidget {
  const GridTiles({super.key});

  @override
  State<GridTiles> createState() => _GridTilesState();
}

class _GridTilesState extends State<GridTiles> with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildFlipAnimation() {
      void initState() {
        animationController.forward();
      }

      void dispose() {
        animationController.dispose();
      }

      return GestureDetector(
        onDoubleTap: () {},
        onTap: () {
          setState(() {
            _showFrontSide = !_showFrontSide;
          });
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: __transitionBuilder,
          layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
          switchInCurve: Curves.easeInBack,
          switchOutCurve: Curves.easeInBack.flipped,
          child: _showFrontSide ? _buildFront() : _buildRear(),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemCount: 12,
      itemBuilder: (BuildContext _context2, int index) {
        final Animation<double> animation =
            Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval((1 / 60) * index, 1.0,
                //curve: Interval((1 / 6) * index, 1.0,

                curve: Curves.fastOutSlowIn),
          ),
        );
        animationController.forward();
        return AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext _context2, Widget? child) {
            return FadeTransition(
              opacity: animation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 50 * (1.0 - animation.value), 0.0),
                child: _buildFlipAnimation(),
              ),
            );
          },
        );
        ;
      },
    );
    ;
  }
}

Widget __buildLayout({Key? key, String? faceName, Color? backgroundColor}) {
  return Container(
    key: key,
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(10.0),
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
      /*  var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.001;
      tilt *= isUnder ? -1.0 : 1.0; */
      final value = isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
      return Transform(
        transform: Matrix4.rotationY(value) /* ..setEntry(3, 0, tilt) */,
        alignment: Alignment.center,
        child: widget,
      );
    },
  );
}

/* class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key? key,
      required this.title,
      required this.questions,
      required this.animationController,
      required this.animation,
      required this.callback,
      required this.level})
      : super(key: key);

  final VoidCallback callback;
  final AnimationController animationController;
  final Animation<double> animation;
  final String title;
  final int questions;
  final String level;

  void initState() {
    animationController.forward();
  }

  void dispose() {
    animationController.dispose();
  }

  @override
  Widget build(BuildContext _context2) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext _context2, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                callback();
              },
              child: Container(
                child: Stack(
                  fit: StackFit.passthrough,
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Positioned(
                      bottom: tablet ? 14.h : 10.h,
                      child: Container(
                        height: 20.h,
                        width: 98.w,
                        //color: Colors.green,
                        child: Padding(
                            padding: tablet
                                ? EdgeInsets.fromLTRB(15.w, 0, 15.w, 0)
                                : EdgeInsets.fromLTRB(2.w, 0, 0, 0),
                            child: Row(children: <Widget>[
                              //SizedBox(width: 2.w),
                              Text(
                                '$level', //'$questions questions',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: tablet ? 8.sp : 11.sp,
                                  letterSpacing: 0.27,
                                  color: Colors.grey[500],
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.access_time,
                                color: Colors.red[200],
                                size: tablet ? 18 : 12,
                              ),
                              //SizedBox(width: 18),
                            ])),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(
                            0.03), //Colors.red[300].withOpacity(0.05),
                        borderRadius: BorderRadius.all(Radius.circular(16.0.r)),
                        // border: new Border.all(
                        // color: AppTheme.notWhite),
                      ),
                      child: Container(
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                            //color: Colors.red[300],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16.0.r),
                                topLeft: Radius.circular(16.0.r))),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset('assets/design_course/fivr.png',
                            fit: BoxFit.fill),
                      ),
                    ),
                    Positioned(
                      top: tablet ? 49.h : 42.h,
                      child: Container(
                        //color: Colors.yellow,
                        width: tablet ? 68.w : 96.w,
                        child: Text(
                          title,
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: tablet ? 8.sp : 12.sp,
                            letterSpacing: 0.27,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

@override
Widget build(BuildContext _context2) {
  return AnimatedBuilder(
    animation: animationController,
    builder: (BuildContext _context2, Widget? child) {
      return FadeTransition(
        opacity: animation,
        child: Transform(
          transform:
              Matrix4.translationValues(0.0, 50 * (1.0 - animation.value), 0.0),
          child: InkWell(),
        ),
      );
    },
  );
}
 */