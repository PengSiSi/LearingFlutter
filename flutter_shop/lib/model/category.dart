class CategoryBigModel {
  String mallCategoryId;
  String mallCategoryName;

  CategoryBigModel({
    this.mallCategoryId,
    this.mallCategoryName
  });

  factory CategoryBigModel.fromJson(dynamic json) {
    return CategoryBigModel(
      mallCategoryId: json['mallCategoryId'],
      mallCategoryName: json['mallCategoryName']
    );
  }
}

class CategoryBigListModel{
  List<CategoryBigModel> data;
  CategoryBigListModel(this.data);

  factory CategoryBigListModel.fromJson(List json) {
    return CategoryBigListModel(
      json.map((i) => CategoryBigModel.fromJson(i)).toList()
    );
  }
}