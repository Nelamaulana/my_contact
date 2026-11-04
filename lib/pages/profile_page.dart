import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 35),

              AvatarGlow(
                glowColor: const Color(0xFF6558C3),
                duration: const Duration(milliseconds: 2000),
                repeat: true,
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: const Color(0xFFE8E3FA),
                  child: const Icon(
                    Icons.person,
                    size: 75,
                    color: Color(0xFF6558C3),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Nela Ulivatul Zahro Maulana',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6558C3),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Mahasiswa Sistem Informasi',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 30),

              _profileInfo(
                Icons.school,
                'Program Studi',
                'Sistem Informasi',
              ),

              _profileInfo(
                Icons.person_outline,
                'Semester',
                'Semester 5',
              ),

              _profileInfo(
                Icons.palette_outlined,
                'Minat',
                'UI Design, Videografer, Infografis, Database',
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE9FC),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.contacts,
                      size: 35,
                      color: Color(0xFF6558C3),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'My Contact App',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6558C3),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Aplikasi daftar kontak sederhana '
                      'dengan navigasi menu Flutter.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileInfo(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF6558C3),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}