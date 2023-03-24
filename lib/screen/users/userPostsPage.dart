import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_x_example/screen/users/widgets/items/user_post_item.dart';
import '../../service/userId_service.dart';

class UserPostsPage extends StatefulWidget {
   UserPostsPage({this.id,Key? key}) : super(key: key);
   int? id;

  @override
  State<UserPostsPage> createState() => _UserPostsPageState();
}
TextEditingController userIdCtr = TextEditingController();
TextEditingController titleCtr = TextEditingController();
TextEditingController bodyCtr = TextEditingController();

class _UserPostsPageState extends State<UserPostsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: GetUserPostService.getUserIdPost(widget.id!),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: UserPostItem(context: context, post: snapshot.data![i],
                            edit: () {
                              userIdCtr.text = widget.id!.toString();
                              titleCtr.text = snapshot.data![i].title;
                              bodyCtr.text = snapshot.data![i].body;
                            }),
                      );
                    });
              } else {
                return const Center(
                  child: Text('No data'),);
              }
            }),
      ),
    );
  }
}
