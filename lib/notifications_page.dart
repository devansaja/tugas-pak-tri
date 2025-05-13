import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage();

  @override
  NotificationsPageState createState() => NotificationsPageState(); // Ubah nama class State
}

class NotificationsPageState extends State<NotificationsPage> {
  final List<String> mahasiswa = [
    'Waras Tri Wijaya',
    'Abdul Fuad Nurdiansiah',
    'Adi Tegar Setiawan',
    'Afik Muhammad Nur Marzuki',
    'Aji Kia Ramadhani',
    'Alif Akbar Ardiyansyah',
    'Alfi Fadli',
    'Amanda Aditama Nurani',
    'Andri Khoirul Manaf',
    'Arcco Putra Azriyansyah',
    'Atik Setyaningsih',
    'Claudea Cahaya Cinta',
    'Devan Vidhel Azadan',
    'Dina Astritama Wulandari',
    'Garin Dani Saputra',
  ];

  List<String> filteredMahasiswa = [];
  TextEditingController searchController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController namaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredMahasiswa = List.from(mahasiswa); // Hindari referensi langsung
  }

  void filterSearchResults(String query) {
    setState(() {
      filteredMahasiswa =
          mahasiswa
              .where(
                (element) =>
                    element.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Teman'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profil');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search
            TextField(
              controller: searchController,
              onChanged: filterSearchResults,
              decoration: const InputDecoration(
                hintText: 'Cari Teman...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),

            // Daftar teman
            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Supaya scroll pakai SingleChildScrollView
              itemCount: filteredMahasiswa.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(Icons.account_circle_rounded),
                    title: Text(filteredMahasiswa[index]),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Teman dipilih: ${filteredMahasiswa[index]}',
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
