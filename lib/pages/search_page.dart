import 'package:flutter/material.dart';

import '../data/dummy_contacts.dart';
import '../widgets/contact_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedCategory = 'Semua';

  final List<String> categories = [
    'Semua',
    'Keluarga',
    'Teman',
    'Kerja',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredContacts = selectedCategory == 'Semua'
        ? dummyContacts
        : dummyContacts
            .where(
              (contact) =>
                  contact.category == selectedCategory,
            )
            .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cari Kontak',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6558C3),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Pilih kategori untuk mencari kontak',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: const Color(0xFF6558C3),
              ),
            ),
            child: DropdownButtonFormField<String>(
              initialValue: selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Kategori Kontak',
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.category,
                  color: Color(0xFF6558C3),
                ),
              ),
              isExpanded: true,
              items: categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedCategory = value;
                  });
                }
              },
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: Text(
            '${filteredContacts.length} kontak ditemukan',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF6558C3),
            ),
          ),
        ),

        Expanded(
          child: filteredContacts.isEmpty
              ? const Center(
                  child: Text('Kontak tidak ditemukan'),
                )
              : ListView.builder(
                  itemCount: filteredContacts.length,
                  itemBuilder: (context, index) {
                    return ContactCard(
                      contact: filteredContacts[index],
                    );
                  },
                ),
        ),
      ],
    );
  }
}