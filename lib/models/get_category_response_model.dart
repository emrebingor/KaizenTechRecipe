import 'package:json_annotation/json_annotation.dart';

part 'get_category_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetCategoryResponseModel {
  final String? id;
  final String? name;
  final String? description;

  const GetCategoryResponseModel({
    this.id,
    this.name,
    this.description,
  });

  factory GetCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetCategoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoryResponseModelToJson(this);

  static List<GetCategoryResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((e) => GetCategoryResponseModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
