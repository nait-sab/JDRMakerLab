import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jdr_maker/config/app.dart';

class Chargement extends StatefulWidget {
  @override
  State<Chargement> createState() => _ChargementState();
}

class _ChargementState extends State<Chargement> with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  late AnimationController thirdController;
  late Animation<double> thirdAnimation;

  late AnimationController fourthController;
  late Animation<double> fourthAnimation;

  late AnimationController fifthController;
  late Animation<double> fifthAnimation;

  @override
  void initState() {
    super.initState();
    firstController = AnimationController(vsync: this, duration: Duration(seconds: 6));
    firstAnimation = Tween<double>(begin: -pi, end: pi).animate(firstController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    secondAnimation = Tween<double>(begin: -pi, end: pi).animate(secondController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          secondController.forward();
        }
      });

    thirdController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    thirdAnimation = Tween<double>(begin: -pi, end: pi).animate(thirdController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    fourthController = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    fourthAnimation = Tween<double>(begin: -pi, end: pi).animate(fourthController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          fourthController.forward();
        }
      });

    fifthController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    fifthAnimation = Tween<double>(begin: -pi, end: pi).animate(fifthController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fifthController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          fifthController.forward();
        }
      });

    firstController.forward();
    secondController.forward();
    thirdController.forward();
    fourthController.forward();
    fifthController.forward();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    fifthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: App.couleurs().fondPrincipale(),
      child: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: CustomPaint(
            painter: JaugeCirculaire(
              firstAngle: firstAnimation.value,
              secondAngle: secondAnimation.value,
              thirdAngle: thirdAnimation.value,
              fourthAngle: fourthAnimation.value,
              fifthAngle: fifthAnimation.value,
            ),
          ),
        ),
      ),
    );
  }
}

class JaugeCirculaire extends CustomPainter {
  final double firstAngle;
  final double secondAngle;
  final double thirdAngle;
  final double fourthAngle;
  final double fifthAngle;

  JaugeCirculaire({
    required this.firstAngle,
    required this.secondAngle,
    required this.thirdAngle,
    required this.fourthAngle,
    required this.fifthAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint arc = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromLTRB(0, 0, size.width, size.height),
      firstAngle,
      2,
      false,
      arc,
    );

    canvas.drawArc(
      Rect.fromLTRB(size.width * .1, size.height * .1, size.width * .9, size.height * .9),
      secondAngle,
      2,
      false,
      arc,
    );

    canvas.drawArc(
      Rect.fromLTRB(size.width * .2, size.height * .2, size.width * .8, size.height * .8),
      thirdAngle,
      2,
      false,
      arc,
    );

    canvas.drawArc(
      Rect.fromLTRB(size.width * .3, size.height * .3, size.width * .7, size.height * .7),
      fourthAngle,
      2,
      false,
      arc,
    );

    canvas.drawArc(
      Rect.fromLTRB(size.width * .4, size.height * .4, size.width * .6, size.height * .6),
      fifthAngle,
      2,
      false,
      arc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
