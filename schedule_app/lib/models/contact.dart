class Contact {
  late int id;
  late String name;
  late String phone;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      if (id != 0) 'id': id,
    };
  }

  Contact.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    phone = map['phone'];
    id = map['id'];
  }
}
