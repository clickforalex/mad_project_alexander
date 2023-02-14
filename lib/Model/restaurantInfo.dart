class Restaurant {
  String rid;
  String address;
  String name;
  String numberOfRating;
  String openingHours;
  String rating;
  String restaurantImage;
  Restaurant(
      {this.rid,
      this.address,
      this.name,
      this.numberOfRating,
      this.openingHours,
      this.rating,
      this.restaurantImage});
  Restaurant.fromMap(Map<String, dynamic> data) {
    rid = data['rid'];
    address = data['address'];
    name = data['name'];
    numberOfRating = data['numberOfRating'];
    openingHours = data['openingHours'];
    rating = data['rating'];
    restaurantImage = data['restaurantImage'];
  }
  Map<String, dynamic> toMap() {
    return {
      'rid': rid,
      'address': address,
      'name': name,
      'numberOfRating': numberOfRating,
      'openingHours': openingHours,
      'rating': rating,
      'restaurantImage': restaurantImage
    };
  }
}
