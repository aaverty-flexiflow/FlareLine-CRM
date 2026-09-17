class ContactModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String company;
  final String avatar;
  final String status; // 'active', 'inactive'

  ContactModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.company,
    required this.avatar,
    required this.status,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      company: json['company'] ?? '',
      avatar: json['avatar'] ?? '',
      status: json['status'] ?? 'active',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'company': company,
      'avatar': avatar,
      'status': status,
    };
  }

  ContactModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? company,
    String? avatar,
    String? status,
  }) {
    return ContactModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      company: company ?? this.company,
      avatar: avatar ?? this.avatar,
      status: status ?? this.status,
    );
  }
}
