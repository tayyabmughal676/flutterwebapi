import 'package:flutter/material.dart';
import 'package:flutterwebapi/model/post.dart';

class ListViewPosts extends StatelessWidget {
  final List<Post> posts;

  ListViewPosts({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: ListView.builder(
          itemCount: posts.length,
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(height: 10.0),
                ListTile(
                  title: Text(
                    '${posts[position].title}',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  subtitle: Text(
                    '${posts[position].body}',   ////
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  leading: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 28.0,
                        child: Text(
                          'User ${posts[position].userId}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () => _onTapItem(context, posts[position]),
                ),
              ],
            );
          }),
    );
  }

  void _onTapItem(BuildContext context, Post post) {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text(post.id.toString() + ' - ' + post.title)));
  }
}
