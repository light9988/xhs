import 'package:xhs/models/card_data.dart';
import 'package:xhs/models/card_detail_data.dart';
import 'package:xhs/models/comment.dart';
import 'package:xhs/models/video.dart';

class Mock {
  static List<CardData> indexData = [
    CardData(
      1,
      1001,
      // "https://www.xiaohongshu.com/explore/65d85d550000000007006716",
      "assets/images/p2.png",
      "OOTD",
      "assets/images/b2.png",
      "Blair",
      2099,
      1788,
      600,
    ),
    CardData(
      2,
      1000,
      // "https://www.xiaohongshu.com/explore/65d44051000000000b0230b4",
      "assets/images/p1.png",
      "Beautiful clothes for Spring",
      "assets/images/b1.png",
      "Alice",
      1199,
      2999,
      599,
    ),
    CardData(
      3,
      1003,
      // "https://www.xiaohongshu.com/explore/65dab1be000000000b020430",
      "assets/images/p3.png",
      "California Cherry Blooming",
      "assets/images/b3.png",
      "Christina",
      1983,
      1366,
      357,
    ),
    CardData(
      4,
      1005,
      // "https://www.xiaohongshu.com/explore/65dc4129000000000b00d78f",
      "assets/images/p5.png",
      "Kyoto Spring",
      "assets/images/b4.png",
      "Flora",
      356,
      327,
      99,
    ),
    CardData(
      5,
      1006,
      // "https://www.xiaohongshu.com/explore/65caf9cd000000000c007cdb",
      "assets/images/p6.png",
      "Sydney Walk",
       "assets/images/b4.png",
      "Glori",
      768,
      521,
      69,
    ),
    CardData(
      6,
      1004,
      // "https://www.xiaohongshu.com/explore/65d2a990000000000702445f",
      "assets/images/p4.png",
      "South Italy",
      "assets/images/b4.png",
      "Doris",
      9999,
      6987,
      299,
    ),
  ];

  static List<CardDetailData> cardDetailDataList = [
    CardDetailData(
      1,
      1001,
      "OOTD",
      "Spring OOTD",
      "assets/images/b2.png",
      "Blair",
      2099,
      1788,
      600,
      "2024-02-28 10:30:29",
      "New York",
      [
        "assets/images/p2.png",
        "assets/images/p21.png",
        "assets/images/p22.png",
      ],
    ),
    CardDetailData(
      2,
      1000,
      "Beautiful clothes for Spring",
      "Wear beaufitul clothes in Spring, love the season!",
      "assets/images/b1.png",
      "Alice",
      1199,
      2999,
      599,
      "2024-03-01 11:30:29",
      "Los Angeles",
      [
        "assets/images/p1.png",
        "assets/images/p11.png",
      ],
    ),
    CardDetailData(
      3,
      1003,
      "California Cherry Blooming",
      "Come to see the cherry blooming in California",
      "assets/images/b3.png",
      "Christine",
      1983,
      1366,
      357,
      "2023-03-27 09:28:56",
      "San Franscisco",
      [
        "assets/images/p3.png",
        "assets/images/p31.png",
      ],
    ),
    CardDetailData(
      4,
      1005,
      "Kyoto Spring",
      "3 days trip in Kyoto",
      "assets/images/b5.png",
      "Flora",
      356,
      327,
      99,
      "2023-04-06 16:54:27",
      "Kyoto",
      [
        "assets/images/p5.png",
      ],
    ),
    CardDetailData(
      5,
      1006,
      "Sydney Walk",
      "a beautiful day walking in Sydney",
      "assets/images/b6.png",
      "Glori",
      768,
      521,
      69,
      "2023-12-15 17:25:26",
      "Sydney",
      [
        "assets/images/p6.png",
      ],
    ),
    CardDetailData(
      6,
      1004,
      "South Italy",
      "Never miss the south Italy!",
      "assets/images/b4.png",
      "Doris",
      9999,
      6987,
      299,
      "2023-08-09 18:54:28",
      "Italy",
      [
        "assets/images/p4.png",
        "assets/images/p41.png",
      ],
    ),
  ];

  static List<Comment> commentList = [
    Comment(
      1,
      "Nana",
      "assets/images/b2.png",
      "Looks amazing!",
      "2024-03-01 16:54:27",
      20,
      false,
      "Los Angeles",
    ),
    Comment(
      2,
      "momo",
      "assets/images/b3.png",
      "Great!",
      "2024-03-01 20:48:17",
      60,
      false,
      "Seattle",
    ),
  ];

  static List<Video> videoList = [
    Video(
        1,
        // "https://static.ybhospital.net/test-video-10.MP4",
        // "https://www.tiktok.com/@moontellthat/video/7336746646006680863",
        "https://media.w3.org/2010/05/sintel/trailer.mp4",
        "the world",
        1,
        "Hila",
       "assets/images/b1.png",
        false,
        true,
        false,
        356,
        323,
        95,
        60),
    Video(
        2,
        // "https://v.douyin.com/iNKJf7eD",
         "https://media.w3.org/2010/05/sintel/trailer.mp4",
        "movie",
        2,
        "Lily",
        "assets/images/b2.png",
        false,
        true,
        false,
        1639,
        3265,
        265,
        90),
    Video(
        3,
        // "https://v.douyin.com/iNKeUwwQ",
        "https://static.ybhospital.net/test-video-6.mp4",
        "aloha",
        2,
        "Jenny",
        "assets/images/b3.png",
        false,
        true,
        false,
        5526,
        1935,
        165,
        723),
    // Video(
    //     4,
    //     "https://static.ybhospital.net/test-video-7.mp4",
    //     "hahahahaha",
    //     2,
    //     "Krol",
    //     "assets/images/b4.png",
    //     false,
    //     true,
    //     false,
    //     5526,
    //     1935,
    //     165,
    //     102),
    // Video(
    //     5,
    //     "https://static.ybhospital.net/test-video-7.mp4",
    //     "amazing ocean",
    //     2,
    //     "maggie",
    //     "assets/images/b5.png",
    //     false,
    //     true,
    //     false,
    //     1526,
    //     2135,
    //     625,
    //     202),
    // Video(
    //     6,
    //     "https://static.ybhospital.net/test-video-6.mp4",
    //     "hahahahaha",
    //     2,
    //     "Marry",
    //     "assets/images/b6.png",
    //     false,
    //     true,
    //     false,
    //     3326,
    //     435,
    //     573,
    //     901),
    // Video(
    //     7,
    //     "https://static.ybhospital.net/test-video-6.mp4",
    //     "hahaha",
    //     2,
    //     "Sara",
    //     "assets/images/b6.png",
    //     false,
    //     true,
    //     false,
    //     526,
    //     135,
    //     65,
    //     102),
    Video(
        8,
        "https://static.ybhospital.net/test-video-7.MP4",
        "Game",
        2,
        "Anne",
        "assets/images/b6.png",
        false,
        true,
        false,
        526,
        135,
        65,
        102),
  ];
}
