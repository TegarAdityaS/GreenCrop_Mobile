import 'package:flutter/material.dart';
import 'package:ui_13/api_data/plant_model.dart';
import 'package:ui_13/services/api_service.dart';
import 'package:ui_13/core/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ui_13/page/details_page.dart';
import 'package:ui_13/page/filter_page.dart';
import 'package:ui_13/api_data/category_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<CategoryModel>> futureCategories;
  late Future<List<PlantModel>> futurePlants;
  int activePage = 0;

  @override
  void initState() {
    super.initState();
    futureCategories = ApiService().fetchCategories();
    futurePlants = ApiService().fetchPlants(0); // Initialize with the first category
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        automaticallyImplyLeading: false,
        leadingWidth: 40,
        leading: TextButton(
          onPressed: () {},
          child: Image.asset(
            'assets/icons/menu.png',
          ),
        ),
        actions: [
          Container(
            height: 40.0,
            width: 40.0,
            margin: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
            decoration: BoxDecoration(
              color: green,
              boxShadow: [
                BoxShadow(
                  color: green.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/pro.png'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<CategoryModel>>(
              future: futureCategories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Failed to load categories'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No categories available'));
                } else {
                  List<CategoryModel> categories = snapshot.data!;
                  return SizedBox(
                    height: 35.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: categories.map((category) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              futurePlants = ApiService().fetchPlants(category.id);
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                category.name,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }
              },
            ),
            FutureBuilder<List<PlantModel>>(
              future: futurePlants,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Failed to load plants'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No plants available'));
                } else {
                  List<PlantModel> plants = snapshot.data!;
                  return SizedBox(
                    height: 320.0,
                    child: CarouselSlider.builder(
                      itemCount: plants.length,
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 15),
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        viewportFraction: 0.8,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activePage = index;
                          });
                        },
                      ),
                      itemBuilder: (BuildContext context, int index, int realIndex) {
                        bool active = index == activePage;
                        return slider(active, index, plants);
                      },
                    ),
                  );
                }
              },
            ),
            // Konten lainnya ...
          ],
        ),
      ),
    );
  }

  AnimatedContainer slider(bool active, int index, List<PlantModel> plants) {
    double margin = active ? 20 : 30;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: mainPlantsCard(index, plants),
    );
  }

  Widget mainPlantsCard(int index, List<PlantModel> plants) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => DetailsPage(plant: plants[index]),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
          ],
          border: Border.all(color: green, width: 2),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: lightGreen,
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                  image: NetworkImage(plants[index].imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: CircleAvatar(
                backgroundColor: green,
                radius: 15,
                child: Image.asset(
                  'assets/icons/add.png',
                  color: white,
                  height: 15,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  '${plants[index].name} - \$${plants[index].price.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
