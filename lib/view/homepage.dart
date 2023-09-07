import 'package:flutter/material.dart';
import 'package:synarion_project/controller/food_items.dart';
import 'package:synarion_project/model/food_items.dart';
import 'package:synarion_project/utils/colors.dart';
import 'package:synarion_project/utils/sizedbox.dart';
import 'package:synarion_project/widgets/categorie_options.dart';
import 'package:synarion_project/widgets/featured_foods.dart';
import 'package:synarion_project/widgets/icons_top.dart';
import 'package:synarion_project/widgets/recommended_food_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> recommendedItems = List.generate(5, (index) {
      List<FastFoodItem> allItems = FoodItemsList.convertingMaptoObject();
      return FoodList(item: allItems[index]);
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight15,
              // icons top--------------------------
              const IconsTop(
                color: Color.fromARGB(255, 221, 126, 158),
                imageUrl:
                    'https://img.freepik.com/premium-vector/avatar-portrait-kid-caucasian-boy-round-frame-vector-illustration-cartoon-flat-style_551425-43.jpg',
              ),
              // search for recipes heading---------------
              const SizedBox(height: 25),
              const Text(
                ' SEARCH FOR\n RECIPES',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              kHeight15,
              // search widget
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 235, 232, 232),
                ),
                child: TextFormField(
                  enabled: false,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                      labelText: 'Search',
                      labelStyle: TextStyle(color: kgrey),
                      prefixIcon: Icon(
                        Icons.search,
                        color: kgrey,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Recommended',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              // food options recommended--------------------
              SizedBox(
                height: 210,
                child: ListView.separated(
                  separatorBuilder: (context, index) => kWidth10,
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedItems.length,
                  itemBuilder: (context, index) {
                    return recommendedItems[index];
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Column(
                children: [
                  CategorieFoodsOptions(),
                ],
              ),
              kHeight15,
              //featured options------------------------------------
              Flexible(
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (context, index) => kHeight10,
                  itemBuilder: (context, index) {
                    List<FastFoodItem> allItems =
                        FoodItemsList.convertingMaptoObject();
                    return FeaturedFoods(
                      item: allItems[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
