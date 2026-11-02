import 'package:flutter/material.dart';

class GradeFourHubScreen extends StatelessWidget {
  const GradeFourHubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00ACC1),
        title: const Text('صنف چهارم مکتب 🌟'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSubjectTile('ریاضی صنف چهارم: اعداد عشاری و محیط', Colors.orange, Icons.calculate),
          const SizedBox(height: 12),
          _buildSubjectTile('دری صنف چهارم: دستور زبان و شعرهای محلی', Colors.blue, Icons.menu_book),
          const SizedBox(height: 12),
          _buildSubjectTile('ساینس صنف چهارم: منظومه شمسی و انرژی', Colors.green, Icons.public),
          const SizedBox(height: 12),
          _buildSubjectTile('تاریخ و جغرافیا: جغرافیای افغانستان', Colors.brown, Icons.terrain),
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
