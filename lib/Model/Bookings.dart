class Booking {
  String bid;
  String user;
  String restuarant;
  String description;
  Booking({this.bid, this.user, this.restuarant, this.description});
  Booking.fromMap(Map<String, dynamic> data) {
    bid = data['bid'];
    user = data['user'];
    restuarant = data['restuarant'];
    description = data['description'];
  }
  Map<String, dynamic> toMap() {
    return {
      'bid': bid,
      'user': user,
      'restuarant': restuarant,
      'description': description
    };
  }
}
