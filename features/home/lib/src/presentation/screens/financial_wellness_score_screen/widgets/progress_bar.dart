import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  static const double _barHeight = 16;

  const ProgressBar({
    super.key,
    required this.percent,
    required this.color,
  });

  final double percent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final themeManager = ThemeManager.of(context);
    final themeColors = themeManager.themeColors;
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        decoration: BoxDecoration(
          color: themeColors.defaultBorderColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Container(
              width: constraints.maxWidth * percent,
              height: _barHeight,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth,
              height: _barHeight,
              child: CustomPaint(
                painter: _CurvedDividerPainter(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _CurvedDividerPainter extends CustomPainter {
  final Color color;

  _CurvedDividerPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();

    final divider1X = size.width / 3;
    final divider2X = 2 * size.width / 3;

    const curveRadius = 10.0;

    path.moveTo(divider1X - curveRadius, 0);
    path.quadraticBezierTo(divider1X, 0, divider1X, curveRadius);
    path.lineTo(divider1X, size.height - curveRadius);
    path.quadraticBezierTo(
        divider1X, size.height, divider1X - curveRadius, size.height);

    path.moveTo(divider2X - curveRadius, 0);
    path.quadraticBezierTo(divider2X, 0, divider2X, curveRadius);
    path.lineTo(divider2X, size.height - curveRadius);
    path.quadraticBezierTo(
        divider2X, size.height, divider2X - curveRadius, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
