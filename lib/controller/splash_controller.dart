import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_example/models/postModel.dart';
import 'package:get_x_example/service/post_service.dart';
import '../service/users_service.dart';
import '../service/utils_service.dart';

class SplashController extends GetxController {
  var isLoading = false.obs;
  var posts = [].obs;

  TextEditingController userIdCtr = TextEditingController();
  TextEditingController titleCtr = TextEditingController();
  TextEditingController bodyCtr = TextEditingController();

  void apiSplashList() async {
    isLoading.value = true;
    var res = await GetPostService.getPost();
    if(res != null){
      posts.value = res;
    }
    isLoading.value = false;
  }

  void deletePost(BuildContext context, PostModel post) async {
    isLoading.value = true;
    bool result = await GetPostService.deletePost(post.id);
    if (result) {
      Utils.snackBarSucces('Deleted successfully', context);
    } else {
      Utils.snackBarError('Something is wrong', context);
    }
    isLoading.value = false;
  }

  void editPost(
      BuildContext context,
      PostModel post,
      int index
      ) {
    isLoading.value = true;
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
    isLoading.value = false;
  }

  void addPost(
      BuildContext context,
      ){
    isLoading.value = true;
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
    isLoading.value = false;
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