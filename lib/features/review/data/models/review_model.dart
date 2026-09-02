class ReviewModel {
  final String id;
  final String firstName;
  final String lastName;
  final String comment;
  final String avatarUrl;

  ReviewModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.comment, required this.avatarUrl,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json){
    return ReviewModel(
      id: json['_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      comment: json['comment'],
      avatarUrl: 'avatar_url',
    );
  }

}
