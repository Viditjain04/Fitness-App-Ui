import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;

class RadialProgress extends StatefulWidget {
  final double goalCompleted = 0.7;
  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          height: 200,
          width: 200,
          child: Column(
            children: <Widget>[
              Text(
                'WALKING',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27,
                    letterSpacing: 2.0),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: 5.0,
                width: 90.0,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '1.234',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3.0,
                    fontSize: 26),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'CALORIES BURN',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w300,
                    fontSize: 21),
              )
            ],
          ),
        ),
      ),
      painter: RadialPainter(250),
    );
  }
}

class RadialPainter extends CustomPainter {
  double progressindegree = 250;
  RadialPainter(this.progressindegree);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 10.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);
    // TODO: implement paint
    Paint progresspaint = Paint()
      ..color = Colors.blue
      ..shader = LinearGradient(colors: [
        Colors.deepPurple,
        Colors.purpleAccent,
      ]).createShader(Rect.fromCircle(
          center: center,
          radius: size.width / 2)) // for gradient on circle slider
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    canvas.drawArc(
        Rect.fromCircle(
          center: center,
          radius: size.width / 2,
        ),
        math.radians(-90),
        math.radians(progressindegree),
        false,
        progresspaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
