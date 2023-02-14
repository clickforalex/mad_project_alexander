import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_project_alexander/Screens/AddBookings.dart';
import 'package:mad_project_alexander/Screens/RestaurantDetailPage.dart';
import '../class.dart';
import 'DetailPage.dart';

class Restaurant {
  final String image;
  final String restaurantName;
  final String category;
  final String information;

  Restaurant(this.image, this.restaurantName, this.category, this.information);
}

class ProductPage extends StatelessWidget {
  final List<String> images = <String>[
    'sushitei.jpg',
    'ichiban.jpg',
    'KFC.jpg',
    'McDonalds.jpg',
    'crave.jpg'
  ];
  final List<String> restaurantName = <String>[
    "Sushi Tei",
    "Ichiban Sushi",
    "KFC",
    "McDonald's",
    "Crave Nasi Lemak"
  ];
  final List<String> information = <String>[
    "A modest homegrown Japanese Kaiten (conveyor belt) chain, our open-kitchen concept allows patrons to appreciate the culinary skills of our restaurants’ chefs while relishing mouth-watering savouries.",
    "Quality and value ply the conveyor belts at Ichiban Sushi. Choose from a wide range of sushi and sashimi to the combination set meals at affordable prices, and enjoy the sincere, personal service that we pride ourselves on.",
    "We are passionate about serving our customers freshly prepared, great tasting food with a key part of this being The Colonel's signature blend of 11 herbs and spices. Even today these remain a secret with the original recipe under lock and key in our headquarters in Kentucky, USA.",
    "Back in 1954, a man named Ray Kroc discovered a small burger restaurant in California, and wrote the first page of our history. From humble beginnings as a small restaurant, we're proud to have become one of the world's leading food service brands with more than 36,000 restaurants in more than 100 countries.",
    "Savour the nation's favourite by indulging at Crave, enjoy some award-winning Adam Road Nasi Lemak by Selera Rasa, topped off with crunchy flavourful ikan bilis, nuts and the tantalising iconic sambal! What's more? Top it off with the famous teh tarik from Rafee's Corner for a fulfilling meal! "
  ];

  final restaurantDetails = [
    'Location : Northpoint',
    'Location : Takashimaya',
    'Location : Orchard',
    'Location : Thompson Plaza',
    'Location : Takashimaya',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/AlexCompanyPic.png',
                fit: BoxFit.fill,
                height: 50.0,
                width: 50.0,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Welcome back ' +
                      FirebaseAuth.instance.currentUser.email.split('@').first +
                      "!"))
            ],
          ),
          backgroundColor: Colors.black38,
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return _buildGridCards(
                context,
                index,
                'images/rest_${index + 1}.jpg',
                restaurantName[index],
                restaurantDetails[index]);
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 8,
          ),
          itemCount: restaurantName.length,
        ));
  }
}

Widget _buildGridCards(BuildContext context, int index, String imgPath,
    String restaurantName, String restaurantDetails) {
  int photo = index;
  return Card(
    color: Colors.lightBlueAccent[50],
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2),
    ),
    child: Container(
      height: 150,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Hero(
              tag: photo,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          index: index,
                          imgPath: imgPath,
                          restaurantName: restaurantName,
                          restaurantDetails: restaurantDetails,
                          photo: photo,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 500,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imgPath),
                          fit: BoxFit.fitWidth,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: ListTile(
              title: Text(
                restaurantName,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                restaurantDetails,
                style: TextStyle(fontSize: 14.0),
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_sharp),
                color: Colors.black,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      index: index,
                      imgPath: imgPath,
                      restaurantName: restaurantName,
                      restaurantDetails: restaurantDetails,
                      photo: photo,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
