import 'package:faker/faker.dart';
import '../models/contact_model.dart';

final faker = Faker();

final List<ContactModel> dummyContacts = List.generate(
  15,
  (index) {
    final categories = ['Keluarga', 'Teman', 'Kerja'];

    return ContactModel(
      name: faker.person.name(),
      phone: faker.phoneNumber.us(),
      email: faker.internet.email(),
      addedAt: DateTime.now().subtract(
        Duration(days: index * 3),
      ),
      category: categories[index % categories.length],
    );
  },
);