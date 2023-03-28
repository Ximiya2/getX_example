import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_example/models/postModel.dart';
import 'package:get_x_example/service/post_service.dart';
import '../service/users_service.dart';
import '../service/utils_service.dart';

class StarterController extends GetxController {
  var isLoading = false;
  var posts = [];

  TextEditingController userIdCtr = TextEditingController();
  TextEditingController titleCtr = TextEditingController();
  TextEditingController bodyCtr = TextEditingController();

  void apiStarterList() async {
    isLoading = true;
    update();
    var res = await GetPostService.getPost();
    if(res != null){
      posts = res;
    }
    isLoading = false;
    update();
  }

  void deletePost(BuildContext context, PostModel post) async {
    isLoading = true;
    update();
    bool result = await GetPostService.deletePost(post.id);
    if (result) {
      Utils.snackBarSucces('Deleted successfully', context);
    } else {
      Utils.snackBarError('Something is wrong', context);
    }
    isLoading = false;
    update();
  }

  void editPost(
      BuildContext context,
      PostModel post,
      int index
      ) {
    isLoading = true;
    update();
    userIdCtr.text = post.userId.toString();
    titleCtr.text = post.title;
    bodyCtr.text = post.body;
    _showBottomSheet(context, () async {
          if(userIdCtr.text.isNotEmpty && titleCtr.text.isNotEmpty && bodyCtr.text.isNotEmpty) {
            PostModel newPost = PostModel(
                userId: int.parse(userIdCtr.text),
                id: int.parse(post.id.toString()[index]),
                title: titleCtr.text,
                body: bodyCtr.text);
            bool result = await GetPostService.editPost(newPost);

            if(result){
              Utils.snackBarSucces('Update successfully', context);
              Navigator.pop(context);
            } else {
              Utils.snackBarError('Someting is wrong', context);
            }
          } else {
            Utils.snackBarError('Please fill all fileds', context);
          }
        });
    isLoading = false;
    update();
  }

  void addPost(
      BuildContext context,
      ){
    isLoading = true;
    update();
    _showBottomSheet(context, () async {
      if(userIdCtr.text.isNotEmpty && titleCtr.text.isNotEmpty && bodyCtr.text.isNotEmpty) {
        PostModel newPost = PostModel(
            userId: int.parse(userIdCtr.text),
            id: 1,
            title: titleCtr.text,
            body: bodyCtr.text);
        bool result = await GetPostService.editPost(newPost);

        if(result){
          Utils.snackBarSucces('Update successfully', context);
          Navigator.pop(context);
        } else {
          Utils.snackBarError('Someting is wrong', context);
        }
      } else {
        Utils.snackBarError('Please fill all fileds', context);
      }
    });
    isLoading = false;
    update();
  }

  void _showBottomSheet(BuildContext context, void Function() func) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context,) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Add new post',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  TextFormField(
                    controller: userIdCtr,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'UserId'),
                  ),
                  TextFormField(
                    controller: titleCtr,
                    decoration: InputDecoration(labelText: 'Age'),
                  ),
                  TextFormField(
                    controller: bodyCtr,
                    decoration: InputDecoration(labelText: 'Salary'),
                  ),
                  ElevatedButton(
                    onPressed: func,
                    child: Text('Add'),
                  ),
                  SizedBox(height: 400,)
                ],
              ),
            ),
          );
        });
  }
}