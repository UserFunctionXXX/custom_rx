import 'dart:convert';

class RepoModel {
  final int id;
  final String fullname;
  final String htmlUrl;
  final String name;
  
  RepoModel({
    required this.id,
    required this.fullname,
    required this.htmlUrl,
    required this.name,
  });
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'full_name': fullname,
      'html_url': htmlUrl,
      'name': name,
    };
  }

  factory RepoModel.fromMap(Map<String, dynamic> map) {
    return RepoModel(
      id: map['id'],
      fullname: map['full_name'],
      htmlUrl: map['html_url'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RepoModel.fromJson(String source) => RepoModel.fromMap(json.decode(source));
}
