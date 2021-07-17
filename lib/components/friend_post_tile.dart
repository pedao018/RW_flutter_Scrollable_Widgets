import 'package:flutter/material.dart';
import 'package:fooderlich/components/circle_image.dart';
import 'package:fooderlich/models/models.dart';

class FriendPostTile extends StatelessWidget {
  final Post post;

  const FriendPostTile({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleImage(
              imageProvider: AssetImage(post.profileImageUrl), imageRadius: 20),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.comment),
              Text('${post.timestamp} mins ago',
                  style: TextStyle(fontWeight: FontWeight.w700))
            ],
          ))
        ],
      ),
    );
  }
}
