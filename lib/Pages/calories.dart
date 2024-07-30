// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const Color red = Color.fromARGB(255, 152, 14, 4);

class CaloriesPage extends StatefulWidget {
  @override
  _CaloriesPageState createState() => _CaloriesPageState();
}

class _CaloriesPageState extends State<CaloriesPage> {
  final TextEditingController searchController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<String> foods = [];
  List<int> calories = [];
  List<String> filteredFoods = [];

  @override
  void initState() {
    super.initState();
    fetchFoodData();
  }

  void fetchFoodData() async {
    final QuerySnapshot snapshot = await firestore.collection('Foods').get();

    setState(() {
      foods = snapshot.docs
          .map<String>((doc) => doc['foodName'] as String)
          .toList();
      calories =
          snapshot.docs.map<int>((doc) => doc['calories'] as int).toList();
      filteredFoods = List.from(foods); // Copy the entire food list initially
    });
  }

  void filterFoods(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredFoods = foods
            .where((food) => food.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredFoods = List.from(
            foods); // Show the entire food list when the query is empty
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: red,
        title: Text('Food Calories'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final String? selected = await showSearch(
                context: context,
                delegate: FoodSearchDelegate(foods),
              );

              if (selected != null && selected.isNotEmpty) {
                filterFoods(selected);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Foods',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredFoods.length,
                itemBuilder: (context, index) {
                  final foodIndex = foods.indexOf(filteredFoods[index]);
                  return ListTile(
                    title: Text(filteredFoods[index]),
                    subtitle: Text('Calories: ${calories[foodIndex]}'),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: double.infinity,
              child: const SingleChildScrollView(
                child: Text(
                  "DISCLAIMER:\nIt’s important to note that these are all rough estimates and can vary depending on the size of the serving and how the food is prepared. Additionally, different brands or types of the same food can have slightly different calorie counts. It’s always a good idea to read the nutrition labels and use measuring tools to get a more accurate estimate of calorie intake.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodSearchDelegate extends SearchDelegate<String> {
  final List<String> foods;

  FoodSearchDelegate(this.foods);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? foods
        : foods
            .where((food) => food.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}
