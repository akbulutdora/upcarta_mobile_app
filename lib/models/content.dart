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

  Content({
    required this.title,
    required this.id,
    required this.contentType,
  });
}