import 'package:flutter/material.dart';
import 'math_game_screen.dart';
import 'grade_two_hub.dart';
import 'grade_three_hub.dart';
import 'grade_four_hub.dart';
import 'grade_five_hub.dart';

class AppLegalInfo {
  static const String appName = "Setara Educational App (ستاره)";
  static const String appVersion = "1.3.0-Professional";
  static const String serialNumber = "STR-AFG-2026-REG-9874102";
  static const String ownerName = "مالک قانونی: محترم [نام شما]";
  static const String copyrightText = "© 2026 تمامی حقوق مادی و معنوی محفوظ و بنام مالک ثبت می‌باشد.";
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _showLegalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: const [
            Icon(Icons.verified_user, color: Colors.blue, size: 28),
            SizedBox(width: 8),
            Text('شناسنامه و لایسنس رسمی', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(AppLegalInfo.appName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue)),
            SizedBox(height: 6),
            Text('نسخه: ${AppLegalInfo.appVersion}'),
            SizedBox(height: 6),
            Text('شماره سریال (Serial NO):', style: TextStyle(fontWeight: FontWeight.bold)),
            SelectableText(AppLegalInfo.serialNumber, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            Divider(height: 20),
            Text(AppLegalInfo.ownerName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green)),
            SizedBox(height: 8),
            Text(AppLegalInfo.copyrightText, style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('تایید و بستن', style: TextStyle(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E88E5),
        title: const Text('اپلیکیشن آموزشی ستاره 🌟', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () => _showLegalDialog(context),
            tooltip: 'شناسنامه و لایسنس',
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            margin: const EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD54F),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: const [
                Icon(Icons.star, color: Colors.orange, size: 22),
                SizedBox(width: 4),
                Text('۱۲', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFFFD54F),
                    child: Icon(Icons.star_rounded, size: 45, color: Colors.orange),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'سلام دوستم! من ستارک هستم. صنف خود را انتخاب کن تا با هم درس بخوانیم و نوشتن تمرین کنیم!',
                      style: TextStyle(fontSize: 15, color: Color(0xFF2C3E50), height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('انتخاب صنف (۱ تا ۵):', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildGradeCard(context, 'صنف اول', 'ریاضی، دری، ساینس و تمرین نوشتن', Colors.orange, true, const MathGameScreen()),
                  _buildGradeCard(context, 'صنف دوم', 'اعداد تا ۱۰۰، جمله‌سازی و خطاطی', const Color(0xFF673AB7), true, const GradeTwoHubScreen()),
                  _buildGradeCard(context, 'صنف سوم', 'ضرب، کسرها و تمرین نوشتاری', const Color(0xFFE91E63), true, const GradeThreeHubScreen()),
                  _buildGradeCard(context, 'صنف چهارم', 'اعداد عشاری و منظومه شمسی', const Color(0xFF00ACC1), true, const GradeFourHubScreen()),
                  _buildGradeCard(context, 'صنف پنجم', 'تناسب، درصد و تاریخ افغانستان', const Color(0xFF3F51B5), true, const GradeFiveHubScreen()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradeCard(BuildContext context, String title, String subtitle, Color color, bool isOpen, Widget targetScreen) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(isOpen ? Icons.school_rounded : Icons.lock, color: color),
        ),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
        onTap: () {
          if (isOpen) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));
          }
        },
      ),
    );
  }
}
