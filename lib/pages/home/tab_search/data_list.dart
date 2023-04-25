// Searchpage list and data

class RoomListItemData {
  final String id;
  final String title;
  final String subTitle;
  final String imageUrl;
  final List<String> tags;
  final int price;

  const RoomListItemData(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.imageUrl,
      required this.tags,
      required this.price});
}

const List<RoomListItemData> dataList = [
  RoomListItemData(
      title: 'Chaoyangmen South Street 2 rooms and 1 bathroom RMB 8300',
      subTitle: "Two rooms/114/East|North/Chaoyangmen South Street",
      imageUrl:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu9t1kxj30lo0c7796.jpg",
      price: 1200,
      id: '1',
      tags: [
        "Near Metro",
        "Central heating",
        "New on",
      ]),
  RoomListItemData(
      title: 'For rent - CBD HQ2 Close to China World Trade Center',
      subTitle: "One bedroom/110/West/CBD Headquarters Apartments II",
      imageUrl:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu5s7gcj30lo0c7myq.jpg",
      price: 6000,
      id: '3',
      tags: ["Near Metro", "Viewings at any time"]),
  RoomListItemData(
      title: 'Chaoyangmen South Street 2 rooms and 1 bathroom RMB 8300',
      subTitle: "Two rooms/114/East|North/Chaoyangmen South Street",
      imageUrl:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu5s7gcj30lo0c7myq.jpg",
      price: 1200,
      id: '2',
      tags: [
        "Near Metro",
        "Central heating",
        "New on",
      ]),
  RoomListItemData(
      title: 'For rent - CBD HQ2 Close to China World Trade Center',
      subTitle: "One bedroom/110/West/CBD Headquarters Apartments II",
      imageUrl:
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6wtu9t1kxj30lo0c7796.jpg",
      price: 6000,
      id: '41',
      tags: ["Near Metro", "Viewings at any time"]),
];
