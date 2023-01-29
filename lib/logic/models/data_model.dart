library data.model;

class AddressData {
  final String avenue;
  final String? town;
  final String zone;
  final int number;
  final String commune;

  AddressData({
    required this.avenue,
    required this.zone,
    required this.number,
    required this.commune,
    this.town,
  });


  Map<String,dynamic> asMap() => {
    'avenue': avenue,
    'town': town,
    'zone': zone,
    'number': number,
    'commune': commune,
  };

  factory AddressData.fromMap(Map<String,dynamic> map) => AddressData(
    avenue: map['avenue'],
    zone: map['zone'],
    number:map['number'],
    commune: map['commune'],
    town: map['town'],
  );

  Map<String, dynamic> toMap() {
    return asMap();
  }

}

class Ratings {
  final dynamic id;
  final int score;
  final String message;
  final String userCode;
  final String shopCode;
  final DateTime timeMessage;
  final DateTime? timeShopMessage;
  final String? shopMessage;

  const Ratings({
    required this.score,
    required this.message,
    required this.userCode,
    required this.shopCode,
    required this.timeMessage,
    this.id,
    this.timeShopMessage,
    this.shopMessage});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'score': score,
      'message': message,
      'userCode': userCode,
      'shopCode': shopCode,
      'timeMessage': timeMessage,
      'timeShopMessage': timeShopMessage,
      'shopMessage': shopMessage,
    };
  }

  factory Ratings.fromMap(Map<String, dynamic> map) {
    return Ratings(
      id: map['id'] as dynamic,
      score: map['score'] as int,
      message: map['message'] as String,
      userCode: map['userCode'] as String,
      shopCode: map['shopCode'] as String,
      timeMessage: map['timeMessage'] as DateTime,
      timeShopMessage: map['timeShopMessage'] as DateTime,
      shopMessage: map['shopMessage'] as String,
    );
  }
}

class ImageLinkStorage {
  final dynamic id;
  final String? primaryPath;
  final List<String> paths;

  const ImageLinkStorage({
    this.id,
    this.primaryPath,
    this.paths = const <String>[],
  });

  List<String?> toList() => [primaryPath, ...paths];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'primaryPath': primaryPath,
      'paths': paths,
    };
  }

  factory ImageLinkStorage.fromMap(Map<String, dynamic> map) {
    return ImageLinkStorage(
      id: map['id'] as dynamic,
      primaryPath: map['primaryPath'] as String,
      paths: map['paths'] as List<String>,
    );
  }
}


extension on DateTime {
  static DateTime datePlan(
      {required int day, required int hour, required int minute}) {
    var d = DateTime.now();
    return DateTime(
      d.year,
      d.month,
      day,
      hour,
      minute,
    );
  }
}