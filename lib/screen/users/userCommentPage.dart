import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_x_example/screen/users/widgets/items/user_comment_item.dart';
import '../../service/userId_service.dart';

class UserCommentPage extends StatefulWidget {
  UserCommentPage({this.id,Key? key}) : super(key: key);
  int? id;

  @override
  State<UserCommentPage> createState() => _UserCommentPageState();
}
TextEditingController userIdCtr = TextEditingController();
TextEditingController titleCtr = TextEditingController();
TextEditingController bodyCtr = TextEditingController();

class _UserCommentPageState extends State<UserCommentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Post Comments', style: TextStyle(color: Colors.white),),
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: GetUserPostService.getUserIdComment(widget.id!),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i){
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: UserCommetItem(
                            context: context,
                            comment: snapshot.data![i],
                        ),
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
