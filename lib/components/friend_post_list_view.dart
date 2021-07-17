import 'package:flutter/material.dart';
import 'package:fooderlich/components/friend_post_tile.dart';
import 'package:fooderlich/models/models.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;

  const FriendPostListView({Key key, this.friendPosts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Social Chefs 👩‍🍳',
              style: Theme.of(context).textTheme.headline1),
          SizedBox(height: 16),
          ListView.separated(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final post = friendPosts[index];
                return FriendPostTile(post: post);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16);
              },
              itemCount: friendPosts.length),
          SizedBox(height: 16)
        ],
      ),
    );
  }
}
