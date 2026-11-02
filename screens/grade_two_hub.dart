import 'package:flutter/material.dart';

class GradeTwoHubScreen extends StatelessWidget {
  const GradeTwoHubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF673AB7),
        title: const Text('صنف دوم مکتب 🌟'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSubjectTile('ریاضی صنف دوم: اعداد تا ۱۰۰', Colors.orange, Icons.calculate),
          const SizedBox(height: 12),
          _buildSubjectTile('دری صنف دوم: جمله‌سازی و املانویسی', Colors.blue, Icons.menu_book),
          const SizedBox(height: 12),
          _buildSubjectTile('ساینس صنف دوم: گیاهان و فصول سال', Colors.green, Icons.eco),
        ],
      ),
    );
  }

  Widget _buildSubjectTile(String title, Color color, IconData icon) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.2), child: Icon(icon, color: color)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
