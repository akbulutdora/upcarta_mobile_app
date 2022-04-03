enum ContentType {
  video,
  article,
  podcastEpisode,
  book,
  course,
  tweet,
  presentation,
  paper,
  audio,
  documentary,
  website,
  report,
  transcript,
  forumPost,
  movie,
  series,
  channel,
  blog,
  newsletter,
  podcast,
  tvEpisode
}
// IS IT BETTER TO MAKE TYPE ENUM (will implement a function for getting string) OR STRING?
extension ParseToString on ContentType {
  String getString() {
    return toString().split('.').last;
  }
}

class Content {
  final String title;
  final String id;
  final ContentType contentType;
  final String description;
  final String created_at;
  final String image;
  final String link;
  final String added_by_id; // (id of the user who added this content initially)
  /*parent_id (you may include this self-referential association to keep track of multiple links referring to the same content)
  featured_at (you can use it for featuring specific collections)
  slug (slugified title for clean url sharing - you may leave it out of your scope)*/


  Content({
    required this.title,
    required this.id,
    required this.contentType,
    required this.description,
    required this.created_at,
    required this.image,
    required this.added_by_id,
    required this.link,
  });
}