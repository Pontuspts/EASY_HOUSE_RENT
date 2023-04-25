// Newsdata preparation, pay attention to the following format

class InfoItem {
  final String title;
  final String imageUrl;
  final String source;
  final String time;
  final String navigateUrl;

  const InfoItem(
      this.title, this.imageUrl, this.source, this.time, this.navigateUrl);
}

const List<InfoItem> infoData = [
  InfoItem(
      'Home Options | Three Bedroom, One Bathroom Quaint Home in the River',
      'https://wx2.sinaimg.cn/mw1024/005SQLxwly1g6f89l4obbj305v04fjsw.jpg',
      "Salaya",
      "Two days ago",
      'login'),
  InfoItem(
      'Home Choice | Dali Royal Palace An elegant retreat between the Cang Mountains and the Er Sea',
      'https://wx2.sinaimg.cn/mw1024/005SQLxwly1g6f89l6hnsj305v04fab7.jpg',
      "Bangkok",
      "A week ago",
      'login'),
  InfoItem(
      'Property Options | Home Ownership Cottage Garden House',
      'https://wx4.sinaimg.cn/mw1024/005SQLxwly1g6f89l5jlyj305v04f75q.jpg',
      "Salaya",
      "A week ago",
      'login'),
  InfoItem(
      'Property Options | Home Ownership Cottage Garden House',
      'https://wx4.sinaimg.cn/mw1024/005SQLxwly1g6f89l5jlyj305v04f75q.jpg',
      "Bangkok",
      "A week ago",
      'login'),
  InfoItem(
      'Property Options | Home Ownership Cottage Garden House',
      'https://wx4.sinaimg.cn/mw1024/005SQLxwly1g6f89l5jlyj305v04f75q.jpg',
      "Salaya",
      "A week ago",
      'login'),
];
