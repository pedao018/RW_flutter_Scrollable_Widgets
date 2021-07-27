import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:provider/provider.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      // 2
      child: Center(
        // 3
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 2 / 1,
              child: Image.asset('assets/fooderlich_assets/empty_list.png'),
            ),
            SizedBox(height: 8.0),
            Text('No Groceries', style: TextStyle(fontSize: 21.0)),
            SizedBox(height: 16.0),
            Text(
              'Shopping for ingredients?\n'
              'Tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              onPressed: () {
                Provider.of<TabManager>(context, listen: false).goToRecipes();
              },
              textColor: Colors.white,
              child: Text('Browse Recipes'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
