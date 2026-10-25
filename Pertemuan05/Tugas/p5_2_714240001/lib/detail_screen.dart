import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String nama;
  final String npm;

  const DetailScreen({super.key, required this.nama, required this.npm});

  static const List<String> gallery = [
    'assets/images/gallery1.jpeg',
    'assets/images/gallery2.jpeg',
    'assets/images/gallery3.jpeg',
    'assets/images/gallery4.jpeg',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Profil'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nama,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'NPM: $npm',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tentang Saya',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
             'Mahasiswa D4 Teknik Informatika yang memiliki minat di bidang '
              'mobile development dan UI/UX design. Di waktu luang, aktif '
              'berorganisasi serta senang bersosialisasi dan mempelajari hal baru.',
            style: TextStyle(
            fontSize: 14,
            height: 1.5,
            color: Colors.black87,
            ),
            textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Gallery Aktivitas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: gallery.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        gallery[index],
                        width: 240,
                        height: 180,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stack) => Container(
                          width: 240,
                          height: 180,
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.image, size: 60),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}