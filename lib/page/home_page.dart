import 'dart:async'; // Tambahkan ini untuk menggunakan Timer
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ui_13/core/color.dart';
import 'package:ui_13/data/category_model.dart';
import 'package:ui_13/data/plant_data.dart';
import 'package:ui_13/page/details_page.dart';
import 'package:ui_13/page/filter_page.dart';
import 'package:ui_13/data/plant_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();
  Timer? _timer;
  int selectId =
      0; // Mendefinisikan selectId sebagai integer dengan nilai awal 0
  int activePage =
      0; // Mendefinisikan activePage sebagai integer dengan nilai awal 0

  @override
  void initState() {
    controller = PageController(viewportFraction: 0.6, initialPage: 0);

    _timer = Timer.periodic(Duration(seconds: 15), (Timer timer) {
      int nextPage = controller.page!.toInt() + 1;
      if (nextPage >= plants.length) {
        nextPage = 0;
      }
      controller.animateToPage(nextPage,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Row(
                children: [
                  Container(
                    height: 45.0,
                    width: 300.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: green),
                      boxShadow: [
                        BoxShadow(
                          color: green.withOpacity(0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 45,
                          width: 250,
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/icons/search.png',
                          height: 25,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 45.0,
                    width: 45.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                    ),
                    child: Image.asset(
                      'assets/icons/adjust.png',
                      color: white,
                      height: 25,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < categories.length; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectId = categories[i].id;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FilterPage(category: categories[i].name),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            categories[i].name,
                            style: TextStyle(
                              color: selectId == categories[i].id
                                  ? Colors.green
                                  : Colors.black.withOpacity(0.7),
                              fontSize: 16.0,
                            ),
                          ),
                          if (selectId == categories[i].id)
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green,
                            )
                        ],
                      ),
                    )
                ],
              ),
            ),
            SizedBox(
              height: 320.0,
              child: CarouselSlider.builder(
                itemCount: plants.length,
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 15),
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.5,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activePage = index;
                    });
                  },
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  bool active = index == activePage;
                  return slider(active, index);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                      color: black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/more.png',
                    color: green,
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 130.0,
              child: ListView.builder(
                itemCount: populerPlants.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 20.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (itemBuilder, index) {
                  return Container(
                    width: 200.0,
                    margin: const EdgeInsets.only(right: 20, bottom: 10),
                    decoration: BoxDecoration(
                      color: lightGreen,
                      boxShadow: [
                        BoxShadow(
                          color: green.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              populerPlants[index].imagePath,
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  populerPlants[index].name,
                                  style: TextStyle(
                                    color: black.withOpacity(0.7),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  '\$${populerPlants[index].price.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    color: black.withOpacity(0.4),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer slider(active, index) {
    double margin = active ? 20 : 30;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: mainPlantsCard(index),
    );
  }

  Widget mainPlantsCard(index) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return _buildBottomSheet(plants[index]);
          },
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
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              plants[index].imagePath,
              width: 150,
              height: 130,
            ),
            const SizedBox(height: 1.0),
            Text(
              plants[index].name,
              style: TextStyle(
                color: black.withOpacity(0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
            // Text(
            //   '\$${plants[index].price.toStringAsFixed(0)}',
            //   style: TextStyle(
            //     color: black.withOpacity(0.4),
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(Plants plant) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 400.0,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plant.name,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: black.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            '\$${plant.price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: green,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            'Description',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: black.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            plant.description,
            style: TextStyle(
              fontSize: 16.0,
              color: black.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Close',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(plant: plant),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'View Details',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
