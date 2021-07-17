import 'package:flutter/material.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  final List<ExploreRecipe> recipes;

  const TodayRecipeListView({Key key, this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        children: [
          Text(
            'Recipes of the Day 🍳',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 16),
          Container(
            height: 300,
            color: Colors.transparent,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return buildCard(recipe);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 16,
                  );
                },
                itemCount: recipes.length),
          )
        ],
      ),
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('This card doesn\'t exist yet');
    }
  }
}
