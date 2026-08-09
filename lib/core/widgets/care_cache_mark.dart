import 'dart:math' as math;

import 'package:flutter/material.dart';

class CareCacheMark extends StatelessWidget {
  const CareCacheMark({this.size = 32, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ExcludeSemantics(
      child: SizedBox.square(
        dimension: size,
        child: CustomPaint(
          painter: _CareCacheMarkPainter(
            ringColor: colors.brightness == Brightness.light
                ? const Color(0xFF30358F)
                : colors.primary,
            checkColor: colors.secondary,
          ),
        ),
      ),
    );
  }
}

class _CareCacheMarkPainter extends CustomPainter {
  const _CareCacheMarkPainter({required this.ringColor, required this.checkColor});

  final Color ringColor;
  final Color checkColor;

  @override
  void paint(Canvas canvas, Size size) {
    final shortestSide = size.shortestSide;
    final ringRect = Rect.fromCenter(
      center: size.center(Offset.zero),
      width: shortestSide * 0.66,
      height: shortestSide * 0.66,
    );
    canvas.drawArc(
      ringRect,
      math.pi / 4,
      math.pi * 1.5,
      false,
      Paint()
        ..color = ringColor
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = shortestSide * 0.112,
    );

    final check = Path()
      ..moveTo(size.width * 0.35, size.height * 0.51)
      ..lineTo(size.width * 0.465, size.height * 0.625)
      ..lineTo(size.width * 0.748, size.height * 0.35);
    canvas.drawPath(
      check,
      Paint()
        ..color = checkColor
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = shortestSide * 0.088,
    );
  }

  @override
  bool shouldRepaint(_CareCacheMarkPainter oldDelegate) {
    return oldDelegate.ringColor != ringColor || oldDelegate.checkColor != checkColor;
  }
}
