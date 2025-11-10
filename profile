import 'package:flutter/material.dart';
import 'widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final name = (args != null && args['name'] != null) ? args['name'] as String : 'Anonim';

    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const SizedBox(height: 8),
          CircleAvatar(
            radius: 44,
            child: Text(
              name.isNotEmpty ? name[0].toUpperCase() : 'U',
              style: const TextStyle(fontSize: 32),
            ),
          ),
          const SizedBox(height: 12),
          Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Ini halaman profil. Anda bisa menampilkan detail lain di sini.'),
          const SizedBox(height: 20),

          const CustomCard(title: 'Info Akun', subtitle: 'Email: contoh@domain.com'),
          const SizedBox(height: 12),

          CustomButton(label: 'Kembali ke Homepage', onPressed: () => Navigator.pop(context)),
        ]),
      ),
    );
  }
}
