import 'package:flutter/material.dart';

class GradeThreeHubScreen extends StatelessWidget {
  const GradeThreeHubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE91E63),
        title: const Text('صنف سوم مکتب 🌟'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSubjectTile('ریاضی صنف سوم: جدول ضرب و کسرها', Colors.orange, Icons.pie_chart),
          const SizedBox(height: 12),
          _buildSubjectTile('دری صنف سوم: متضادها و حکایات', Colors.blue, Icons.library_books),
          const SizedBox(height: 12),
          _buildSubjectTile('ساینس صنف سوم: جانوران و بدن انسان', Colors.green, Icons.pets),
          const SizedBox(height: 12),
          _buildSubjectTile('اجتماعی صنف سوم: ولایت‌های افغانستان', Colors.purple, Icons.map),
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
