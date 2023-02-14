class Food {
  final String foodname;
  final String desciption;
  final String restaurantname;
  final double price;
  final String foodImage;
  final int feature;

  Food({
    this.foodname,
    this.desciption,
    this.restaurantname,
    this.price,
    this.foodImage,
    this.feature,
  });
}

final allFoods = [
  Food(
    foodname: "Chicken Cutlet",
    desciption:
        "Cripsy chicken cutlet served in homemade sauce and cripsy french fries.",
    restaurantname: "ABC Western Food",
    price: 6.0,
    foodImage: "KFC.jpg",
    feature: 1,
  ),
  Food(
    foodname: "Curry",
    desciption: "Homemade curry with homemade cripsy prata.",
    restaurantname: "Raj's 24 hours stall",
    price: 7.0,
    foodImage: "KFC.jpg",
    feature: 1,
  ),
  Food(
    foodname: "Chicken stick",
    desciption: "2 delicious chicken meats stick.",
    restaurantname: "Raj's 24 hours stall",
    price: 3.0,
    foodImage: "KFC.jpg",
    feature: 0,
  ),
  Food(
    foodname: "Biryani",
    desciption: "Homemade Biryani.",
    restaurantname: "Raj's 24 hours stall",
    price: 5.0,
    foodImage: "KFC.jpg",
    feature: 1,
  ),
  Food(
    foodname: "Prata",
    desciption: "Homemade cripsy prata.",
    restaurantname: "Raj's 24 hours stall",
    price: 2.0,
    foodImage: "KFC.jpg",
    feature: 1,
  ),
  Food(
    foodname: "pizza",
    desciption: "Homemade pizza.",
    restaurantname: "Western A",
    price: 5.0,
    foodImage: "KFC.jpg",
    feature: 1,
  ),
  Food(
    foodname: "Coffee",
    desciption: "Homemade coffee.",
    restaurantname: "Western A",
    price: 3.0,
    foodImage: "KFC.jpg",
    feature: 1,
  ),
  Food(
    foodname: "Ceaser salad ",
    desciption: "Crunchy vegetables.",
    restaurantname: "Western A",
    price: 4.0,
    foodImage: "KFC.jpg",
    feature: 0,
  ),
  Food(
    foodname: "Mash salad",
    desciption: "Delicious mash salad.",
    restaurantname: "Western A",
    price: 4.0,
    foodImage: "KFC.jpg",
    feature: 0,
  ),
  Food(
    foodname: "Brunch meal",
    desciption: "Brunch meal only from 10am to 2pm.",
    restaurantname: "Western A",
    price: 5.0,
    foodImage: "KFC.jpg",
    feature: 0,
  ),
];
