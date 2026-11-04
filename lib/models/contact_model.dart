class ContactModel {
  final String name;
  final String phone;
  final String email;
  final DateTime addedAt;
  final String category;

  ContactModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.addedAt,
    required this.category,
  });
}