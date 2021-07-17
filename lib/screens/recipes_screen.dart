import 'package:flutter/material.dart';
import 'package:fooderlich/api/mock_fooderlich_service.dart';
import 'package:fooderlich/components/components.dart';

class RecipesScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();

  RecipesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: exploreService.getRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RecipesGridView(recipes: snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
