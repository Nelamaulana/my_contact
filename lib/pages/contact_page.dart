import 'package:flutter/material.dart';
import '../data/dummy_contacts.dart';
import '../widgets/contact_card.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daftar Kontak',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6558C3),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Simpan dan lihat semua kontakmu',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: dummyContacts.length,
            itemBuilder: (context, index) {
              final contact = dummyContacts[index];

              return ContactCard(contact: contact);
            },
          ),
        ),
      ],
    );
  }
}