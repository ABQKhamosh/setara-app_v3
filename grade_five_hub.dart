import 'package:flutter/material.dart';

class GradeFiveHubScreen extends StatelessWidget {
  const GradeFiveHubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F51B5),
        title: const Text('صنف پنجم مکتب 🌟'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSubjectTile('ریاضی صنف پنجم: درصد و تناسب', Colors.orange, Icons.analytics),
          const SizedBox(height: 12),
          _buildSubjectTile('دری صنف پنجم: ادبیات و نگارش', Colors.blue, Icons.edit_note),
          const SizedBox(height: 12),
          _buildSubjectTile('ساینس صنف پنجم: سلول و اکوسیستم', Colors.green, Icons.biotech),
          const SizedBox(height: 12),
          _buildSubjectTile('تاریخ و جغرافیا: راه ابریشم و تمدن‌ها', Colors.brown, Icons.history_edu),
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
