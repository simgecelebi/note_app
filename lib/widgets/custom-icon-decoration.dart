import 'package:flutter/material.dart';

class CustomIconDecoration extends Decoration {
  final double iconSize;
  final double lineWidth;
  final bool firsData;
  final bool lastData;

  CustomIconDecoration({
    @required double iconSize,
    @required double lineWidth,
    @required bool firsData,
    @required bool lastData,
  })  : this.iconSize = iconSize,
        this.lineWidth = lineWidth,
        this.firsData = firsData,
        this.lastData = lastData;

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return IconLine(
        iconSize: iconSize,
        lineWidth: lineWidth,
        firsData: firsData,
        lastData: lastData);
  }
}

class IconLine extends BoxPainter {
  final double iconSize;
  final double lineWidth;
  final bool firsData;
  final bool lastData;

  final Paint paintLine;

  IconLine({
    @required double iconSize,
    @required double lineWidth,
    @required bool firsData,
    @required bool lastData,
  })  : this.iconSize = iconSize,
        this.lineWidth = lineWidth,
        this.firsData = firsData,
        this.lastData = lastData,
        paintLine = Paint()
          ..color = Colors.green
          ..strokeCap = StrokeCap.round
          ..strokeWidth = lineWidth
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final leftOfSet = Offset((iconSize / 2) + 24, offset.dy);
    final double iconSpace = iconSize / 1.5;

    final Offset top = configuration.size.topLeft(Offset(leftOfSet.dx, 0.0));
    final Offset centerTop = configuration.size
        .centerLeft(Offset(leftOfSet.dx, leftOfSet.dy - iconSpace));

    final Offset centerBottom = configuration.size
        .centerLeft(Offset(leftOfSet.dx, leftOfSet.dy + iconSpace));

    final Offset end =
        configuration.size.bottomLeft(Offset(leftOfSet.dx, leftOfSet.dy * 2));

    if (!firsData) canvas.drawLine(top, centerTop, paintLine);
    if (!lastData) canvas.drawLine(centerBottom, end, paintLine);
  }
}
