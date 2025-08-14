final class GetCategoryResponseModel {
  GetCategoryResponseModel({
    this.id,
    this.name,
    this.description,
  });

  factory GetCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      GetCategoryResponseModel(
        id: json['id'] is int ? json['id'] as int : null,
        name: json['name'] as String?,
        description: json['description'] as String?,
      );

  static List<GetCategoryResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((e) => GetCategoryResponseModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  String? name;
  String? description;
  int? id;


  Map<String, dynamic> toJson() => {
    'id': id,
    'description': description,
    'name': name,
  };
}
