import 'package:flutter/material.dart';
import 'widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameCtrl = TextEditingController();
  final List<String> demoItems = ['Item A', 'Item B', 'Item C', 'Item D'];

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Homepage'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Contoh 5 Widget di atas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          const CustomCard(title: 'Kartu Contoh', subtitle: 'Deskripsi singkat'),

          const SizedBox(height: 12),
          CustomInput(controller: _nameCtrl, hint: 'Masukkan nama'),
          const SizedBox(height: 12),

          CustomButton(
            label: 'Simpan & Ke Profile',
            onPressed: () {
              final name = _nameCtrl.text.trim();
              Navigator.pushNamed(context, '/profile',
                  arguments: {'name': name.isEmpty ? 'User' : name});
            },
          ),

          const SizedBox(height: 18),
          const Text('Daftar item:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          CustomList(items: demoItems),

          const SizedBox(height: 20),
          Center(
            child: OutlinedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('Lihat Profile'),
              onPressed: () => Navigator.pushNamed(context, '/profile'),
            ),
          ),
        ]),
      ),
    );
  }
}
