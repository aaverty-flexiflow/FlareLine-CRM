class DealModel {
  final String id;
  final String image;
  final String title;
  final String value;
  final String probability;
  final String days;
  final String status; // 'next', 'prospect', 'proposal', 'won'

  DealModel({
    required this.id,
    required this.image,
    required this.title,
    required this.value,
    required this.probability,
    required this.days,
    required this.status,
  });

  factory DealModel.fromJson(Map<String, dynamic> json) {
    return DealModel(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      value: json['value'] ?? '',
      probability: json['probability'] ?? '',
      days: json['days'] ?? '',
      status: json['status'] ?? 'next',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'value': value,
      'probability': probability,
      'days': days,
      'status': status,
    };
  }

  DealModel copyWith({
    String? id,
    String? image,
    String? title,
    String? value,
    String? probability,
    String? days,
    String? status,
  }) {
    return DealModel(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      value: value ?? this.value,
      probability: probability ?? this.probability,
      days: days ?? this.days,
      status: status ?? this.status,
    );
  }
}
