import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String nama = 'Affifah Putri Deza';
  final String npm = '714240001';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Pertemuan 5'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Card(
          elevation: 6,
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/profile.jpeg',
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stack) => Container(
                      width: 160,
                      height: 160,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.person, size: 80),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  nama,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  npm,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(nama: nama, npm: npm),
                      ),
                    );
                  },
                  child: const Text('Lihat Detail Profil'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}