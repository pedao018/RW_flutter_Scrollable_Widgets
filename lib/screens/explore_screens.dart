import 'package:flutter/material.dart';
import 'package:fooderlich/api/mock_fooderlich_service.dart';
import 'package:fooderlich/components/components.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();
  ScrollController _scrollControler;

  @override
  void initState() {
    _scrollControler = ScrollController();
    _scrollControler.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollControler.offset >= _scrollControler.position.maxScrollExtent &&
        !_scrollControler.position.outOfRange) {
      print('reached the bottom');
    }
    if (_scrollControler.offset <= _scrollControler.position.minScrollExtent &&
        !_scrollControler.position.outOfRange) {
      print('reached the top!');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollControler.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, snapshot) {
        // TODO: Add Nested List Views
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data.todayRecipes;
          final friendPosts = snapshot.data.friendPosts;
          return ListView(
            controller: _scrollControler,
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(recipes: recipes),
              SizedBox(height: 16),
              FriendPostListView(friendPosts: friendPosts)
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
