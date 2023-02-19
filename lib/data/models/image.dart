class ImageModel {
  String? imagePath;
  String? imageType;

  ImageModel({this.imagePath, this.imageType});

  ImageModel.fromJson(Map<String, dynamic> json) {
    imagePath = json['image_path'];
    imageType = json['image_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_path'] = imagePath;
    data['image_type'] = imageType;
    return data;
  }
}
