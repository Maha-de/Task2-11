
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_auth.provider.dart';
import '../provider/app_auth.provider.dart';
import '../services/ads_provider.dart';
import '../services/preferences.services.dart';
import '../utilities/edges.dart';
import '../widgets/recommended_widget.dart';
import '../widgets/section_header.dart';
import '../widgets/today_widget.dart';
import 'login.pages.dart';

class HomePageScreen extends StatefulWidget {

  HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  var sliderIndex = 0;
  CarouselController carouselControllerEx = CarouselController();

  // var images = [
  //   "images/slider_image1.jpg",
  //   "images/slider_image2.jpg",
  //   "images/slider_image3.jpg",
  //   "images/slider_image4.jpg",
  //   "images/slider_image5.jpg",
  // ];


  @override
  void initState() {
    // var provider1 =
    Provider.of<AdsProvider>(context, listen: false).getAds();
    // var provider2 = Provider.of<AppAuthProvider>(context, listen: false).providerInit();
    super.initState();
  }

  // void init() async{
  //   await Provider.of<AdsProvider>(context, listen: false).getAds();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Edges.appHorizontalPadding),
          child: Icon(Icons.menu),
        ),
        actions: [
          Icon(Icons.notifications),
          PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) =>
                  [PopupMenuItem<int>(value: 0, child: Text("Logout"))])
        ],
      ),
      body: Stack(children: [

        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Edges.appHorizontalPadding),
          child: ListView(scrollDirection: Axis.vertical,
              children: [
            SizedBox(
              height: 10,
            ),
            // Text("Bonjour, Maha", style: TextStyle(fontSize: 20)),
            // Consumer<AppAuthProvider>( builder: (context, authProvider, _) =>
            //     Text("Bonjour, ${authProvider.nameController!.text}", style: TextStyle(fontSize: 20)),
            // ),
                Consumer<AppAuthProvider>(
                  builder: (context, authProvider, _) {
                    // Check if authProvider and nameController are not null
                    if ( authProvider.nameController != null) {
                      return Text("Bonjour, ${authProvider.nameController!.text}", style: TextStyle(fontSize: 20));
                    } else {
                      // Handle the case where authProvider or nameController is null
                      return Text("Bonjour, Guest", style: TextStyle(fontSize: 20));
                    }
                  },
                ),

                SizedBox(
              height: 10,
            ),
            Expanded(
                child: Text(
              "What would you like to cook today?",
              style: TextStyle(fontSize: 30),
            )),
            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300),
                  height: 50,
                  width: 280,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: "Search for recipes",
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                )
              ],
            ),

            SizedBox(
              height: 10,
            ),
            Consumer<AdsProvider>(builder: (context, value, child){
              return Column(
                children: [
                  CarouselSlider(
                    carouselController: carouselControllerEx,
                    options: CarouselOptions(
                        height: 200.0, autoPlay: true,
                        onPageChanged: (index,_){
                          sliderIndex = index;
                          setState(() {
                          });
                        }),
                    items: value.adList.map((i) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber
                        ),
                        child:
                        Image.network(i.image!, fit: BoxFit.cover,),
                        // Image.asset(i, fit: BoxFit.cover,)
                        // Text('text $i', style: TextStyle(fontSize: 16.0),)
                      );

                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            carouselControllerEx.previousPage(
                              duration: Duration(microseconds: 300),
                              curve: Curves.linear,
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {
                            carouselControllerEx.nextPage(
                              duration: Duration(microseconds: 300),
                              curve: Curves.linear,
                            );
                          },
                          icon: Icon(Icons.arrow_forward, size: 30)),
                    ],
                  ),
                  DotsIndicator(
                    dotsCount: 5,
                    position: sliderIndex,
                    decorator: DotsDecorator(
                      color: Colors.black87, // Inactive color
                      activeColor: Colors.redAccent,
                    ),
                    onTap: (position) async {
                      await carouselControllerEx.animateToPage(position);
                      sliderIndex = position;
                      setState(() {});
                    },
                  ),
                ],
              );
            }),


            SizedBox(
              height: 10,
            ),
            SectionHeader(sectionName: "Today's Fresh Recipes"),

            SizedBox(
              height: 10,
            ),

            Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: 1,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  height: 320,
                                  width: 200,
                                  margin: EdgeInsets.fromLTRB(0, 10, 40, 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.shade300),
                                  child: TodayWidget(
                                      imageName: Image.asset(
                                        "images/french_toast_large.png",
                                        height: 80,
                                        width: 150,
                                      ),
                                      headerText: "Breakfast",
                                      titleText: "French Toast with Berries",
                                      caloriesText: "120 Calories",
                                      timeText: "10 mins",
                                      servingText: "1 Serving"),
                                ),
                                Container(
                                  height: 320,
                                  width: 220,
                                  margin: EdgeInsets.fromLTRB(0, 10, 40, 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.shade300),
                                  child: TodayWidget(
                                      imageName: Image.asset(
                                        "images/cinnamon_large.png",
                                        height: 80,
                                        width: 150,
                                      ),
                                      headerText: "Breakfast",
                                      titleText: "Brown Sugar Cinnamon Toast",
                                      caloriesText: "135 Calories",
                                      timeText: "15 mins",
                                      servingText: "1 Serving"),
                                ),
                              ],
                            );
                          }),
                    ),
                    SectionHeader(sectionName: "Recommended"),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                        child: ListView.separated(
                      itemCount: 1,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            RecommendedWidget(
                                imageName: Image.asset(
                                  "images/muffins_large2.png",
                                  height: 180,
                                  width: 100,
                                ),
                                headerText: "Breakfast",
                                titleText: "Blueberry Muffins",
                                caloriesText: "120 Calories",
                                timeText: "10 mins",
                                servingText: "1 Serving"),
                            SizedBox(
                              height: 10,
                            ),
                            RecommendedWidget(
                                imageName: Image.asset(
                                  "images/glazed_large.png",
                                  height: 180,
                                  width: 100,
                                ),
                                headerText: "Main Dish",
                                titleText: "Glazed Salmon",
                                caloriesText: "280 Calories",
                                timeText: "45 mins",
                                servingText: "1 Serving"),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 15,
                        );
                      },
                    ))
                  ],
                ),
              ),
            )
          ]),
        ),
      ]),
    );
  }

  onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
        PrefrencesService.prefs?.remove("user");
        PrefrencesService.prefs?.remove("password");
        break;
    }
  }
}
