class ImagesModel {
  final String imageUrl;
  final String imageDocId;

  ImagesModel({
    required this.imageUrl,
    required this.imageDocId,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
    imageUrl: json['image_url'] as String? ?? '',
    imageDocId: json['image_doc_id'] as String? ?? '',
  );

  ImagesModel copyWith({
    String? imageUrl,
    String? imageDocId,
  }) =>
      ImagesModel(
        imageUrl: imageUrl ?? this.imageUrl,
        imageDocId: imageDocId ?? this.imageDocId,
      );

  static ImagesModel initialValue() => ImagesModel(
    imageUrl: '',
    imageDocId: '',
  );

  Map<String, dynamic> toJson() => {
    'image_url': imageUrl,
    'image_doc_id': imageDocId,
  };
}
