import 'package:flutter/material.dart';

class DoodlePad extends StatefulWidget {
  const DoodlePad({super.key});

  @override
  State<DoodlePad> createState() => _DoodlePadState();
}

class _DoodlePadState extends State<DoodlePad> {
  final List<DoodlePoint?> _points = [];
  Color _selectedColor = Colors.deepPurple;
  double _strokeWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Doodle Pad'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Clear Canvas',
            onPressed: () => setState(_points.clear),
          ),
        ],
      ),
      body: Column(
        children: [
          // Drawing Area
          Expanded(
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _points.add(
                    DoodlePoint(
                      point: details.localPosition,
                      paint: Paint()
                        ..color = _selectedColor
                        ..strokeCap = StrokeCap.round
                        ..strokeWidth = _strokeWidth,
                    ),
                  );
                });
              },
              onPanEnd: (_) => setState(() => _points.add(null)),
              child: CustomPaint(
                painter: DoodlePainter(_points),
                size: Size.infinite,
              ),
            ),
          ),
          // Toolbar Controls
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.grey.shade200,
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                    value: _strokeWidth,
                    min: 1.0,
                    max: 20.0,
                    onChanged: (val) => setState(() => _strokeWidth = val),
                  ),
                ),
                const SizedBox(width: 12),
                ...[Colors.black, Colors.deepPurple, Colors.blue, Colors.red, Colors.green].map(
                  (color) => GestureDetector(
                    onTap: () => setState(() => _selectedColor = color),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _selectedColor == color ? Colors.black : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DoodlePoint {
  final Offset point;
  final Paint paint;
  DoodlePoint({required this.point, required this.paint});
}

class DoodlePainter extends CustomPainter {
  final List<DoodlePoint?> points;
  DoodlePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!.point, points[i + 1]!.point, points[i]!.paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant DoodlePainter oldDelegate) => true;
}
