class PostModel {
  final String id;
  final String? post;
  final String? nickname;
  final DateTime? time;
  final String? tag;

  PostModel(
      {required this.id,
      required this.post,
      required this.nickname,
      required this.time, 
      required this.tag,
      });
}
