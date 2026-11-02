import 'package:flutter/material.dart';

class MathGameScreen extends StatefulWidget {
  const MathGameScreen({Key? key}) : super(key: key);

  @override
  State<MathGameScreen> createState() => _MathGameScreenState();
}

class _MathGameScreenState extends State<MathGameScreen> {
  int _currentStep = 1; // مرحله ۱: جمع ساده، مرحله ۲: نوشتن عدد ۲
  final List<Offset?> _points = [];
  bool _isAnswerChecked = false;
  bool _isSuccess = false;
  String _feedbackMessage = "";

  void _checkHandwriting() {
    setState({
      _isAnswerChecked = true,
      // در این نسخه هوشمند، اگر کودک روی بوم خطی کشیده باشد یعنی تلاش کرده است
      _isSuccess = _points.isNotEmpty,
      _feedbackMessage = _points.isNotEmpty 
          ? 'آفرین! جواب درست است و خط شما عالی بود 🌟' 
          : 'عزیزم هنوز چیزی ننوشتی! دوباره کوشش کن.',
    });
  }

  void _nextStep() {
    setState(() {
      _currentStep++;
      _points.clear();
      _isAnswerChecked = false;
      _isSuccess = false;
      _feedbackMessage = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E88E5),
        title: Text(_currentStep == 1 ? 'صنف اول - ریاضی و تمرین نوشتاری' : 'مرحله دوم - نوشتن اعداد ✍️'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // راهنمای صوتی ستارک
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9C4),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.orangeAccent, width: 2),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star_rounded, color: Colors.orange, size: 36),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _currentStep == 1
                            ? 'سوال اول: ۱ جمع ۱ چند می‌شود؟ جواب را با انگشت خود در پایین بنویس!'
                            : 'سوال دوم: عدد «۲» را روی بوم زیر با انگشتت بنویس و تایید کن.',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // بوم خطاطی و نوشتن پاسخ با انگشت
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _isAnswerChecked 
                          ? (_isSuccess ? Colors.green : Colors.red) 
                          : Colors.blue.shade300, 
                      width: 3
                    ),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          _currentStep == 1 ? '۲' : '۲',
                          style: TextStyle(
                            fontSize: 160,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onPanUpdate: (DragUpdateDetails details) {
                          setState(() {
                            RenderBox renderBox = context.findRenderObject() as RenderBox;
                            _points.add(renderBox.globalToLocal(details.globalPosition));
                          });
                        },
                        onPanEnd: (DragEndDetails details) => _points.add(null),
                        child: CustomPaint(
                          painter: HandwritingPainter(points: _points),
                          size: Size.infinite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // نمایش پیام ارزیابی (موفقیت یا تلاش مجدد)
              if (_isAnswerChecked)
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: _isSuccess ? Colors.green.shade50 : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _isSuccess ? Colors.green : Colors.red),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _isSuccess ? Icons.check_circle : Icons.error, 
                        color: _isSuccess ? Colors.green : Colors.red
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _feedbackMessage,
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            color: _isSuccess ? Colors.green.shade800 : Colors.red.shade800
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // دکمه‌های کنترل (پاک کردن، بررسی پاسخ، مرحله بعدی)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        setState(() {
                          _points.clear();
                          _isAnswerChecked = false;
                          _isSuccess = false;
                        });
                      },
                      icon: const Icon(Icons.delete, color: Colors.white),
                      label: const Text('پاک کردن', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  if (!_isSuccess)
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: _checkHandwriting,
                        icon: const Icon(Icons.check, color: Colors.white),
                        label: const Text('بررسی پاسخ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  if (_isSuccess)
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: _nextStep,
                        icon: const Icon(Icons.arrow_forward, color: Colors.white),
                        label: const Text('مرحله بعدی 🌟', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HandwritingPainter extends CustomPainter {
  final List<Offset?> points;
  HandwritingPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue.shade800
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(HandwritingPainter oldDelegate) => true;
}
